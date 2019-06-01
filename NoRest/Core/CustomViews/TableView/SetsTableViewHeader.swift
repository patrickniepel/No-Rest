//
//  SetsTableViewHeader.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SetsTableViewHeader: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 13)
        label.text = NRConstants.Texts.reps
        label.textAlignment = .center
        label.textColor = .backgroundColorUIControl
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 13)
        label.text = NRConstants.Texts.weight
        label.textAlignment = .center
        label.textColor = .backgroundColorUIControl
        return label
    }()
    
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
        setup()
    }
    
    func setup() {
        addSubview(stackView)
        stackView.addArrangedSubviews(repsLabel, weightLabel)
        stackView.fillSuperview()
        backgroundColor = .uiControl
    }
}
