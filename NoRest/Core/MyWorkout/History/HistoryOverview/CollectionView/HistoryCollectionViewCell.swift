//
//  HistoryCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 28.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    
    private let dateLabel: NRLabel = {
        let label = NRLabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = nil
    }
    
    func setup(date: Date?) {
        layer.cornerRadius = 20
        backgroundColor = .backgroundColorUIControl
        applyShadow()
        
        guard let date = date else { return }
        let stringDate = Date.withFormat(date: date, format: NRConstants.Date.defaultFormat)
        dateLabel.text = stringDate
        setupLabelLayout()
    }
    
    private func setupLabelLayout() {
        addSubview(dateLabel)
        dateLabel.fillSuperview(padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
    }
}
