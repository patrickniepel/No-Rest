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
        if indexPath.section == Section.yourData.rawValue {
            if let dataResetType = DataReset(rawValue: indexPath.row) {
                let resetAction = ResetDataAction(dataReset: dataResetType)
                store.dispatch(resetAction)
                
                let invalidateAction = InvalidateResetDataAction()
                store.dispatch(invalidateAction)
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            headerView.backgroundView?.backgroundColor = .backgroundColorMain
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footerView = view as? UITableViewHeaderFooterView {
            footerView.textLabel?.textColor = .white
            footerView.backgroundView?.backgroundColor = .backgroundColorMain
        }
    }
}
