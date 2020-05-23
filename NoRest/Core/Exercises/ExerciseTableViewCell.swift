//
//  ExerciseTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: NRTableViewCell {
    private lazy var imageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: NRLabel = .init()
    private lazy var timerTagView: NRTagView = .init()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        exerciseImageView.image = nil
    }
    
    func setup(with exercise: Exercise) {
        exerciseImageView.image = exercise.image
        nameLabel.text = exercise.name
        timerTagView.injectContent(icon: NRStyle.timerIcon, text: exercise.descriptiveRestTimer)
        
        addCustomDisclosureIndicator()
        
        setupView()
    }
    
    private func setupView() {
        [imageBackgroundView, timerTagView, nameLabel].forEach(contentView.addSubview)
        imageBackgroundView.addSubview(exerciseImageView)
        
        let size = bounds.height - NRStyle.verticalPadding
        imageBackgroundView.anchor(leading: contentView.leadingAnchor, centerY: contentView.centerYAnchor, padding: .init(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0), size: .init(width: size, height: size))
        
        let padding = NRStyle.verticalPadding / 2
        exerciseImageView.fillSuperview(padding: .init(top: padding, left: padding, bottom: padding, right: padding))
        
        nameLabel.anchor(top: imageBackgroundView.topAnchor, leading: imageBackgroundView.trailingAnchor, bottom: imageBackgroundView.centerYAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: padding, bottom: padding / 2, right: NRStyle.horizontalPadding))
        
        timerTagView.anchor(top: imageBackgroundView.centerYAnchor, leading: nameLabel.leadingAnchor, bottom: contentView.bottomAnchor, padding: .init(top: padding / 2, left: 0, bottom: padding, right: 0))
    }
}
