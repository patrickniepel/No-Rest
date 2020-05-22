//
//  SettingsTableViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension SettingsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == Section.yourData.rawValue {
            if let dataResetType = DataReset(rawValue: indexPath.row),
                let vc = tableView.presentingViewController as? SettingsTableViewController {
                
                vc.showAlertForDataReset(dataResetType)
            }
        }
        else if indexPath.section == Section.about.rawValue {
            
            // Rating
            if indexPath.row == 0 {
                SettingsController.showRating()
            } else {
                let info: Info = indexPath.row == 1 ? .licenses : indexPath.row == 2 ? .disclaimer : .none
                let infoAction = InfoAction(info: info)
                store.dispatch(infoAction)
                
                let routeAction = RouteAction(screen: .info, in: .settings)
                store.dispatch(routeAction)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = NRStyle.primaryTextColor
            headerView.contentView.backgroundColor = NRStyle.themeColor
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footerView = view as? UITableViewHeaderFooterView {
            footerView.textLabel?.textColor = NRStyle.primaryTextColor
            footerView.contentView.backgroundColor = NRStyle.themeColor
        }
    }
}
