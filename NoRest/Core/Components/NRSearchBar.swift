//
//  NRSearchBar.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRSearchBar: UISearchBar {
    
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        autocapitalizationType = .none
        autocorrectionType = .no
        showsCancelButton = true
        showsSearchResultsButton = false
        tintColor = NRStyle.themeColor
        keyboardType = .default
        keyboardAppearance = .dark
        backgroundImage = UIImage()
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): NRStyle.complementaryColor], for: .normal)
        
        //Dye icon
        if let textField = value(forKey: "searchField") as? UITextField,
            let iconView = textField.leftView as? UIImageView {
            
            textField.backgroundColor = NRStyle.primaryTextColor
            textField.textColor = NRStyle.themeColor
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = NRStyle.themeColor
        }
    }
}
