//
//  WorkoutSessionCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSessionCollectionViewCell: NRCollectionViewCell {
    private lazy var nameLabel: NRLabel = {
        let label = NRLabel()
        label.textAlignment = .center
        return label
    }()
    
    private var exercise: Exercise?
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setup(with exercise: Exercise) {
        self.exercise = exercise
        
        setupView()
        setupContent()
    }
    
    private func setupView() {
        [nameLabel].forEach(contentView.addSubview)
        
        nameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))
    }
    
    private func setupContent() {
        nameLabel.text = exercise?.name
    }
}
