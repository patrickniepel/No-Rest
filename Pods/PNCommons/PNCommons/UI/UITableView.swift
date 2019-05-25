//
//  UITableView.swift
//  PNCommons
//
//  Created by Patrick Niepel on 05.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UITableView {
    
    /**
     Registers one or more UITableViewCells
     - parameter cellClasses: The cell classes to register
     */
    func registerCells<T: UITableViewCell>(cellClasses: T.Type...) {
        cellClasses.forEach { register($0, forCellReuseIdentifier: $0.className) }
    }
}
