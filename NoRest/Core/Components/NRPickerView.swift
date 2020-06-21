//
//  NRPickerView.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRPickerView: UIPickerView {
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = NRStyle.themeColor
        tintColor = NRStyle.primaryTextColor
    }
}
