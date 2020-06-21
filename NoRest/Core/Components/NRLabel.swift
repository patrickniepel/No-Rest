//
//  NRLabel.swift
//  NoRest
//
//  Created by Patrick Niepel on 03.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRLabel: UILabel, Themeable {
    typealias Theme = LabelTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(with title: String = "", size: CGFloat = NRStyle.fontSizeRegular) {
        self.init()

        subscribeTheme()

        text = title
        font = UIFont(name: NRStyle.boldFont, size: size)
        textAlignment = .left
    }

    func subscribeTheme() {
        self.observe(theme: \ApplicationTheme.native.labelTheme)
    }

    func apply(theme: Theme) {
        textColor = theme.textColor
    }
}

class NRLabelDark: UILabel, Themeable {
    typealias Theme = DarkLabelTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(with title: String = "", size: CGFloat = NRStyle.fontSizeRegular) {
        self.init()

        subscribeTheme()

        text = title
        font = UIFont(name: NRStyle.boldFont, size: size)
        textAlignment = .left
    }

    func subscribeTheme() {
        self.observe(theme: \ApplicationTheme.native.darkLabelTheme)
    }

    func apply(theme: Theme) {
        textColor = theme.textColor
    }
}
