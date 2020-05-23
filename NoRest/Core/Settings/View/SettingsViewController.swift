//
//  SettingsViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsViewController: NRViewController {
    private lazy var tableView: NRTableView = .init()
    let settingsCtrl: SettingsController
    
    init() {
        settingsCtrl = SettingsController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        viewControllerTitle = "settings.title".localized
        
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(SettingsUnitTableViewCell.self, forCellReuseIdentifier: SettingsUnitTableViewCell.reuseIdentifier)
        tableView.register(SettingsTimerTableViewCell.self, forCellReuseIdentifier: SettingsTimerTableViewCell.reuseIdentifier)
        tableView.register(NRDefaultTableViewCell.self, forCellReuseIdentifier: NRDefaultTableViewCell.reuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.fillSuperview()
    }
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsCtrl.settingsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch settingsCtrl.settingsItems[indexPath.row] {
        case .unit:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsUnitTableViewCell.reuseIdentifier, for: indexPath) as! SettingsUnitTableViewCell
            cell.setup()
            return cell
        
        case .timer:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTimerTableViewCell.reuseIdentifier, for: indexPath) as! SettingsTimerTableViewCell
            cell.setup()
            return cell
        
        case .action(let title, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: NRDefaultTableViewCell.reuseIdentifier, for: indexPath) as! NRDefaultTableViewCell
            cell.setup(title: title, accessoryType: .disclosureIndicator)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return NRConstants.copyright
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch settingsCtrl.settingsItems[indexPath.row] {
        case .action(_ , let action):
            action()
            
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footerView = view as? UITableViewHeaderFooterView {
            footerView.textLabel?.textColor = NRStyle.primaryTextColor
            footerView.textLabel?.font = UIFont(name: NRStyle.regularFont, size: NRStyle.fontSizeSmall)
            footerView.contentView.backgroundColor = NRStyle.themeColor
        }
    }
}
