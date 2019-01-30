//
//  SettingsYourDataTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsYourDataTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(for dataDeletion: DataDeletion) {
        self.selectionStyle = .none
        if dataDeletion == .workoutHistory {
            
        } else if dataDeletion == .statistics {
            
        }
    }

}
