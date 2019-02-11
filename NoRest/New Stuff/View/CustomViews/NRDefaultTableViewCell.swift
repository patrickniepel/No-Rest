//
//  NRDefaultTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 04.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

/** Cell only with a label and accessory type */
class NRDefaultTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(title: String, accessoryType: AccessoryType = .disclosureIndicator) {
        self.accessoryType = accessoryType

        let textLabel = NRLabel(with: title)
        contentView.addSubview(textLabel)
        textLabel.fillSuperview(padding: UIEdgeInsets(top: 0, left: .leadingPaddingCell, bottom: 0, right: 0))
    }

}
