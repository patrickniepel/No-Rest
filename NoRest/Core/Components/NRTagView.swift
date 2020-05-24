//
//  NRTagView.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRTagView: UIView {
    private lazy var iconImageView: NRImageView = .init()
    
    private lazy var textLabel: NRLabel = {
        let label = NRLabel(with: "", size: NRStyle.fontSizeSmall)
        label.textColor = NRStyle.themeColor
        return label
    }()
    
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [iconImageView, textLabel].forEach(addSubview)
        
        layer.cornerRadius = 5
        backgroundColor = NRStyle.complementaryColor
        
        let padding = NRStyle.verticalPadding / 4
        iconImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: 0))
        iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor).isActive = true
        textLabel.anchor(leading: iconImageView.trailingAnchor, trailing: trailingAnchor, centerY: iconImageView.centerYAnchor, padding: .init(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    func injectContent(icon: UIImage?, text: String) {
        iconImageView.image = icon?.dye(NRStyle.themeColor)
        textLabel.text = text
    }
}
