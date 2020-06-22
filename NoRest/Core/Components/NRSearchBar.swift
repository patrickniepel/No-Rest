//
//  NRSearchBar.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRSearchBar: UISearchBar, Themeable {
    typealias Theme = SearchBarTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.native.searchBarTheme)

        autocapitalizationType = .none
        autocorrectionType = .no
        showsCancelButton = false
        showsSearchResultsButton = false
        keyboardType = .default
        keyboardAppearance = .dark
        backgroundImage = UIImage()

        applyShadow()
    }

    func apply(theme: Theme) {
        tintColor = theme.themeColor

        UIBarButtonItem.appearance(whenContainedInInstancesOf:
        [UISearchBar.self]).setTitleTextAttributes([
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): theme.interactionColor
        ], for: .normal)

        //Dye icon
        if let textField = value(forKey: "searchField") as? UITextField,
            let iconView = textField.leftView as? UIImageView {

            textField.backgroundColor = theme.textColor
            textField.textColor = theme.themeColor
            textField.font = theme.textFont
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = theme.themeColor
        }
    }
}
