//
//  NRPageControl.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRPageControl: UIPageControl, Themeable {
    typealias Theme = PageControlTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.native.pageControlTheme)

        isUserInteractionEnabled = false
        hidesForSinglePage = true
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
        pageIndicatorTintColor = theme.textColor
        currentPageIndicatorTintColor = theme.accentuationColor
    }
}
