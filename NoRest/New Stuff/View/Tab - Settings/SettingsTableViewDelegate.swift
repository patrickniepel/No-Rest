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
            
            // Rating
            if indexPath.row == 0 {
                SettingsController.showRating()
            }
            // Licenses
            else if indexPath.row == 1 {
                let routeAction = RouteAction(screen: .licenses, in: .settings)
                store.dispatch(routeAction)
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            headerView.backgroundView?.backgroundColor = .mainColor
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footerView = view as? UITableViewHeaderFooterView {
            footerView.textLabel?.textColor = .white
            footerView.backgroundView?.backgroundColor = .mainColor
        }
    }
}
