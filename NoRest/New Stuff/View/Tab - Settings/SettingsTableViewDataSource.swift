//
//  SettingsTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTableViewDataSource: NSObject, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Section.general.rawValue {
            return 2
        } else if section == Section.yourData.rawValue {
            return 2
        } else if section == Section.about.rawValue {
            return 3
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == Section.general.rawValue {
            
            if indexPath.row == 0 { // Unit
                let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.settingsUnitTableViewCell) as? SettingsUnitTableViewCell
                cell?.setup()
                return cell ?? UITableViewCell()
                
            } else if indexPath.row == 1 { // Timer
                let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.settingsTimerTableViewCell) as? SettingsTimerTableViewCell
                cell?.setup()
                return cell ?? UITableViewCell()
            }
            
        } else if indexPath.section == Section.yourData.rawValue {
            
            let currentRow = indexPath.row
            
            if let dataResetType = DataReset(rawValue: currentRow) {
                let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.settingsYourDataTableViewCell) as? SettingsYourDataTableViewCell
                cell?.setup(for: dataResetType)
                return cell ?? UITableViewCell()
            }
            return UITableViewCell()
            
        } else if indexPath.section == Section.about.rawValue {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.nrDefaultTableViewCell) as? NRDefaultTableViewCell
            let title = determineRowTitle(for: indexPath.row)
            cell?.setup(title: title, accessoryType: .disclosureIndicator)
            
            return cell ?? UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    private func determineRowTitle(for row: Int) -> String {
        switch row {
        case 0: return NRConstants.Settings.RowTitles.rating
        case 1: return NRConstants.Settings.RowTitles.licences
        case 2: return NRConstants.Settings.RowTitles.disclaimer
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == Section.general.rawValue {
            return NRConstants.Settings.SectionTitles.general
        } else if section == Section.yourData.rawValue {
            return NRConstants.Settings.SectionTitles.yourData
        } else if section == Section.about.rawValue {
            return NRConstants.Settings.SectionTitles.about
        }
        
        return ""
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == Section.about.rawValue {
            return NRConstants.Settings.copyright
        }
        
        return ""
    }
}

enum Section: Int {
    case general = 0
    case yourData = 1
    case about = 2
    
    static var allCases: [Section] = [.general, .yourData, .about]
}
