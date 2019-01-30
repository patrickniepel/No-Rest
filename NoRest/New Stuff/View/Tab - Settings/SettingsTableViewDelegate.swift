//
//  SettingsTableViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTableViewDelegate: NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == Section.about.rawValue {
            
            if indexPath.row == 0 {
                
            } else if indexPath.row == 1 {
                
            }
        }
    }
}
