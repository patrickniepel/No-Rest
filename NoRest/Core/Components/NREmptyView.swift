//
//  NREmptyView.swift
//  NoRest
//
//  Created by Patrick Niepel on 02.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NREmptyView: UIView {
    enum ArrowDirection {
        case none
        case topRight
        case bottomRight
    }
    
    private lazy var emptyLabel: NRLabel = {
        let label = NRLabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeVeryLarge)
        return label
    }()
    
    private lazy var arrowImageView: NRImageView = {
        let imageView = NRImageView()
        imageView.image = NRConstants.Images.arrow.image?.dye(NRStyle.primaryTextColor)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    convenience init(text: String, arrowDirection: ArrowDirection = .none) {
        self.init()
        
        clipsToBounds = true
        emptyLabel.text = text
        
        setupLabel()
        
        if arrowDirection == .topRight {
            setupArrowTopRight()
        } else if arrowDirection == .bottomRight {
            setupArrowBottomRight()
        }
    }
    
    private func setupLabel() {
        addSubview(emptyLabel)
        emptyLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, centerY: centerYAnchor, padding: UIEdgeInsets(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))
    }
    
    private func setupArrowTopRight() {
        addSubview(arrowImageView)
        arrowImageView.anchor(top: topAnchor, bottom: emptyLabel.topAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: NRStyle.verticalPadding * 2, left: 0, bottom: NRStyle.verticalPadding * 2, right: 0))
    }
    
    private func setupArrowBottomRight() {
        addSubview(arrowImageView)
        arrowImageView.anchor(top: emptyLabel.bottomAnchor, leading: leadingAnchor,bottom: bottomAnchor, padding: UIEdgeInsets(top: NRStyle.verticalPadding * 2, left: 0, bottom: 0, right: 0))
        arrowImageView.transform = arrowImageView.transform.rotated(by: .pi * 0.8)
    }
}
