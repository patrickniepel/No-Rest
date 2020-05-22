//
//  UITableViewCell+Extension.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        self.className
    }
}
