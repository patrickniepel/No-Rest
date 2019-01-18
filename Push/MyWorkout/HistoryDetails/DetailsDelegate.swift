//
//  DetailsDelegate.swift
//  Push
//
//  Created by Patrick Niepel on 15.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class DetailsDelegate: NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = .white
            headerTitle.backgroundView?.backgroundColor = .myBlue
        }
    }
}
