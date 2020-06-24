//
//  NRPickerView.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRPickerView: UIPickerView, Themeable {
    typealias Theme = PickerViewTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        self.observe(theme: \ApplicationTheme.native.pickerViewTheme)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
        tintColor = theme.tintColor
    }
}
