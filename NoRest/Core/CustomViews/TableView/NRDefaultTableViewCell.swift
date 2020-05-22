//
//  NRDefaultTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 04.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

/** Cell with only a label and accessory type */
class NRDefaultTableViewCell: UITableViewCell {
    private let contentLabel: NRLabel = {
        let label = NRLabel()
        return label
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.text = nil
    }
    
    func setup(title: String, accessoryType: AccessoryType = .none) {
        self.accessoryType = accessoryType
        
        contentLabel.text = title
        backgroundColor = NRStyle.themeColor
        contentView.addSubview(contentLabel)
        contentLabel.fillSuperview(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        // Use custom disclosureIndicator
        guard accessoryType == .disclosureIndicator else { return }
        
        self.accessoryType = .none
        
        let imageView = UIImageView()
        imageView.image = NRStyle.disclosureIcon?.dye(NRStyle.complementaryColor)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        addSubview(imageView)
        imageView.anchor(trailing: self.trailingAnchor, centerY: self.centerYAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: NRStyle.horizontalPadding), size: .init(width: 15, height: 15))
    }
}
