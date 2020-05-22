//
//  NREmptyView.swift
//  NoRest
//
//  Created by Patrick Niepel on 02.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NREmptyView: UIView {

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 30)
        label.textColor = NRStyle.primaryTextColor
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NRConstants.Images.arrow.image?.dye(NRStyle.complementaryColor)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    convenience init(text: String, addArrow: Bool = false) {
        self.init()
        clipsToBounds = true
        emptyLabel.text = text
        setupLabel()
        
        if addArrow {
            setupArrow()
        }
    }
    
    private func setupLabel() {
        addSubview(emptyLabel)
        emptyLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, centerX: centerXAnchor, centerY: centerYAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    private func setupArrow() {
        addSubview(arrowImageView)
        arrowImageView.anchor(top: topAnchor, bottom: emptyLabel.topAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 40, left: 0, bottom: 32, right: 0))
    }
}
