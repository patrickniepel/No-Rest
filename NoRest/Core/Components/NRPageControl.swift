//
//  NRPageControl.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRPageControl: UIPageControl {
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = NRStyle.themeColor
        pageIndicatorTintColor = NRStyle.primaryTextColor
        currentPageIndicatorTintColor = NRStyle.complementaryColor
        isUserInteractionEnabled = false
        hidesForSinglePage = true
    }
}
