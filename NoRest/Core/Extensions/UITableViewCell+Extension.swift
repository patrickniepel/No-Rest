//
//  UITableViewCell+Extension.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        self.className
    }
}

extension UITableViewCell {
    func addCustomDisclosureIndicator() {
        self.accessoryType = .none

        let imageView = UIImageView()
        imageView.image = NRStyle.disclosureIcon?.dye(NRStyle.secondaryTextColor)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        addSubview(imageView)
        imageView.anchor(trailing: self.trailingAnchor,
                         centerY: self.centerYAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: NRStyle.horizontalPadding),
                         size: .init(width: 15, height: 15))
    }
}
