//
//  WorkoutSessionCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSessionCollectionViewCell: NRCollectionViewCell {
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var scrollContentView: UIView = .init()
    
    private lazy var nameLabel: NRLabel = {
        let label = NRLabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var topButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var notesButton: UIButton = {
        let button = UIButton()
        button.setImage(NRStyle.notesIcon?.dye(NRStyle.offWhiteColor), for: .normal)
        button.backgroundColor = NRStyle.interactionColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        button.applyShadow()
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var timerButton: UIButton = {
        let button = UIButton()
        button.setImage(NRStyle.timerIcon?.dye(NRStyle.offWhiteColor), for: .normal)
        button.backgroundColor = NRStyle.interactionColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        button.applyShadow()
        button.layer.cornerRadius = 10
        return button
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
        contentView.addSubview(scrollView)
        scrollView.fillSuperview()
        
        scrollView.addSubview(scrollContentView)
        scrollContentView.fillSuperview()
        scrollContentView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        scrollContentView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        [nameLabel, topButtonStackView].forEach(scrollContentView.addSubview)
        
        topButtonStackView.addArrangedSubviews(notesButton, timerButton)
        
        nameLabel.anchor(top: scrollContentView.topAnchor, leading: scrollContentView.leadingAnchor, trailing: scrollContentView.trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))
        
        topButtonStackView.anchor(top: nameLabel.bottomAnchor, leading: scrollContentView.leadingAnchor, trailing: scrollContentView.trailingAnchor, padding: UIEdgeInsets(top: NRStyle.verticalPadding * 2, left: NRStyle.horizontalPadding * 4, bottom: 0, right: NRStyle.horizontalPadding * 4))
        
        let buttonSize = 75
        notesButton.anchor(size: CGSize(width: buttonSize, height: buttonSize))
        timerButton.anchor(size: CGSize(width: buttonSize, height: buttonSize))
    }
    
    private func setupContent() {
        nameLabel.text = exercise?.name
    }
}
