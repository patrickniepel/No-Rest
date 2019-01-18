//
//  SettingsTableViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var resetHButton: UIButton!
    @IBOutlet weak var resetSetsButton: UIButton!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var settingsCtrl : SettingsController?
    var unit : String?
    var segmentIndex : Int?
    var timerSoundActive : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsCtrl = SettingsController()
        unit = settingsCtrl?.loadUnit()
        loadSegmentIndex()
        loadTimerSound()
        
        setupLayout()
    }
    
    private func loadSegmentIndex() {
        if unit == "KG" {
            segmentIndex = 0
        }
        else {
            segmentIndex = 1
        }
    }
    
    private func loadTimerSound() {
        timerSoundActive = settingsCtrl?.loadTimerSound()
    }
    
    private func setupLayout() {
        resetButton.layer.cornerRadius = 10
        resetHButton.layer.cornerRadius = 10
        resetSetsButton.layer.cornerRadius = 10
        segmentControl.selectedSegmentIndex = segmentIndex ?? 0
        soundSwitch.isOn = timerSoundActive ?? false
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        
        segmentIndex = sender.selectedSegmentIndex
        
        if let unitString = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            unit = unitString
        }
        
        settingsCtrl?.saveUnit(unit: unit ?? "")
    }
    
    @IBAction func resetStatistics(_ sender: UIButton) {
        showAlertStatistics()
    }
    
    @IBAction func resetHistory(_ sender: UIButton) {
        showAlertHistory()
    }
    
    @IBAction func switchSound(_ sender: UISwitch) {
        
        timerSoundActive = sender.isOn
        settingsCtrl?.saveTimerSound(active: timerSoundActive ?? false)
    }
    
    private func showAlertStatistics() {
        
        let alert = UIAlertController(title: "Reset Statistics", message: "Are you sure?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { action -> Void in
        }
        
        let resetAction = UIAlertAction.init(title: "Reset", style: .destructive) { action -> Void in
            self.settingsCtrl?.resetStatistics()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(resetAction)
        
        present(alert, animated: true)
    }
    
    private func showAlertHistory() {
        
        let alert = UIAlertController(title: "Reset History", message: "Are your sure?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { action -> Void in
        }
        
        let resetAction = UIAlertAction.init(title: "Reset", style: .destructive) { action -> Void in
            self.settingsCtrl?.resetHistory()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(resetAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func showAlertSets(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Reset Sets", message: "Are your sure?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel) { action -> Void in
        }
        
        let resetAction = UIAlertAction.init(title: "Reset", style: .destructive) { action -> Void in
            self.settingsCtrl?.resetSets()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(resetAction)
        
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor(red: 31/255, green: 134/255, blue: 248/255, alpha: 1)
        }
    }
}
