//
//  MainViewController.swift
//  TableViewSubviewSelection
//
//  Created by kostis stefanou on 7/6/19.
//  Copyright © 2019 silonk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private var dataModel: [MainModel] = []
    
    //Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    private func setUp() {
        tableView.register(UINib(nibName: MainTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MainTableViewCell.identifier)
        createDataModel()
    }
    
    private func createDataModel() {
        for i in 0..<11 { dataModel.append(MainModel(name: "item \(i)")) }
    }
}

// MARK: UITableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.setup(with: dataModel[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectSubviewAt indexPath: IndexPath, with identifier: String) {
        guard let subviewIdentifier = MainTableViewCell.SubviewIdentifiers(rawValue: identifier) else { return }
        
        switch subviewIdentifier {
        case .increase: dataModel[indexPath.row].hitCount += 1
        case .decrease: dataModel[indexPath.row].hitCount -= 1
        }
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
