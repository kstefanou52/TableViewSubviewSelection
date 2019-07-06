//
//  MainTableViewCell.swift
//  TableViewSubviewSelection
//
//  Created by kostis stefanou on 7/6/19.
//  Copyright © 2019 silonk. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    enum SubviewIdentifiers: String {
        case increase
        case decrease
    }
    
    //Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var hitCountLabel: UILabel!
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    
    override func awakeFromNib() {
        increaseButton.layer.cornerRadius = increaseButton.frame.width / 2
        decreaseButton.layer.cornerRadius = increaseButton.frame.width / 2
    }
    
    func setup(with data: MainModel) {
        titleLabel.text = data.name
        hitCountLabel.text = String(data.hitCount)
    }
    
    //Outlet Actions
    @IBAction private func increaseButtonPressed(_ sender: UIButton) {
        callSubItemDelegate(with: SubviewIdentifiers.increase.rawValue)
    }
    
    @IBAction private func decreaseButtonPressed(_ sender: UIButton) {
        callSubItemDelegate(with: SubviewIdentifiers.decrease.rawValue)
    }
}
