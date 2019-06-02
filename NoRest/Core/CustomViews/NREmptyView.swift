//
//  NREmptyView.swift
//  NoRest
//
//  Created by Patrick Niepel on 02.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NREmptyView: UIView {

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 30)
        label.textColor = .textColor
        return label
    }()
    
    convenience init(text: String) {
        self.init()
        emptyLabel.text = text
        //setupLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLabel()
    }
    
    private func setupLabel() {
        addSubviews(emptyLabel)
        emptyLabel.centerInSuperview()
    }
}
