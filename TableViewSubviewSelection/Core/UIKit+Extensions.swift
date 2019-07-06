//
//  UIKit+Extensions.swift
//  TableViewSubviewSelection
//
//  Created by kostis stefanou on 7/6/19.
//  Copyright © 2019 silonk. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func indexPathForSubview(_ subview: UIView?) -> IndexPath? {
        guard let subview = subview else { return nil }
        
        if let cell = subview as? UITableViewCell {
            return self.indexPath(for: cell)
        }
        return self.indexPathForSubview(subview.superview)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    var tableView: UITableView? {
        if superview is UITableView { return superview as? UITableView }
        
        var tempView: UIView? = superview
        repeat {
            guard tempView != nil else { return nil }
            tempView = tempView?.superview
        } while tempView is UITableView
        
        return tempView as? UITableView
    }
    
    func callSubItemDelegate(with identifier: String) {
        guard let tableView = tableView, let indexPath = tableView.indexPathForSubview(self) else { return }
        (tableView.delegate as? UITableViewDelegate)?.tableView?(tableView, didSelectSubviewAt: indexPath, with: identifier)
    }
}

@objc protocol UITableViewDelegate: UIKit.UITableViewDelegate {
    @objc optional func tableView(_ tableView: UITableView, didSelectSubviewAt indexPath: IndexPath, with identifier: String)
}
