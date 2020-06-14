//
//  TutorialCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class TutorialCollectionViewCell: NRCollectionViewCell {
    private lazy var titleLabel: NRLabel = {
        let label = NRLabel()
        return label
    }()
    
    private lazy var tutorialImageView: NRImageView = .init()
    
    private lazy var textLabel: NRLabel = {
        let label = NRLabel()
        label.numberOfLines = 0
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        tutorialImageView.image = nil
        textLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
    }
    
    func setup(with tutorialPage: TutorialPage, showFinishButton: Bool) {
        titleLabel.text = tutorialPage.title
        tutorialImageView.image = tutorialPage.image
        textLabel.text = tutorialPage.text
        
        setupView()
    }
    
    private func setupView() {
        [titleLabel, tutorialImageView, textLabel].forEach(contentView.addSubview)
        
        let horizontalPadding = NRStyle.horizontalPadding
        let verticalPadding = NRStyle.verticalPadding
        
        titleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top:
            verticalPadding, left: horizontalPadding, bottom: 0, right: horizontalPadding))
        tutorialImageView.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, trailing: titleLabel.trailingAnchor, padding: .init(top: verticalPadding, left: 0, bottom: 0, right: 0))
        textLabel.anchor(top: tutorialImageView.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: contentView.bottomAnchor, trailing: titleLabel.trailingAnchor, padding: .init(top: verticalPadding, left: 0, bottom: verticalPadding, right: 0))
    }
}
