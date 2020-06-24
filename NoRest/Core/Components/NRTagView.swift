//
//  NRTagView.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRTagView: UIView, Themeable {
    typealias Theme = TagViewTheme

    private lazy var iconImageView: NRImageView = .init()

    private lazy var textLabel: UILabel = .init()

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.custom.tagViewTheme)

        layer.cornerRadius = 5
    }

    func injectContent(icon: UIImage?, text: String = "") {
        iconImageView.removeFromSuperview()
        textLabel.removeFromSuperview()

        iconImageView.image = icon
        textLabel.text = text

        let padding = NRStyle.verticalPadding / 4

        if icon != nil && text.isEmpty {
            addSubview(iconImageView)
            iconImageView.anchor(top: topAnchor,
                                 leading: leadingAnchor,
                                 bottom: bottomAnchor,
                                 trailing: trailingAnchor,
                                 padding: .init(top: padding, left: padding, bottom: padding, right: padding))
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor).isActive = true
        } else if icon == nil && !text.isEmpty {
            addSubview(textLabel)
            textLabel.anchor(leading: leadingAnchor, trailing: trailingAnchor, centerY: centerYAnchor, padding: .init(top: 0, left: padding, bottom: 0, right: padding))
        } else {
            [iconImageView, textLabel].forEach(addSubview)
            iconImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: 0))
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor).isActive = true
            textLabel.anchor(leading: iconImageView.trailingAnchor,
                             trailing: trailingAnchor,
                             centerY: iconImageView.centerYAnchor,
                             padding: .init(top: 0, left: padding, bottom: 0, right: padding))
        }
    }

    func apply(theme: Theme) {
        backgroundColor = theme.accentuationColor
        textLabel.textColor = theme.textColor
        textLabel.font = theme.textFont
    }
}
