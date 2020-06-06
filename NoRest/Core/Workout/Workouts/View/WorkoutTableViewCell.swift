//
//  WorkoutTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: NRTableViewCell {
    private lazy var nameLabel: NRLabel = .init(with: "", size: NRStyle.fontSizeLarge)
    private lazy var dateTagView: NRTagView = .init()
    private lazy var numberOfExercisesTagView: NRTagView = .init()
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleStartWorkout), for: .touchUpInside)
        button.setTitle("workout.start".localized, for: .normal)
        button.setTitleColor(NRStyle.primaryTextColor, for: .normal)
        button.titleLabel?.font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeRegular)
        button.layer.cornerRadius = 10
        button.backgroundColor = NRStyle.interactionColor
        return button
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
    
    func setup(with workout: Workout) {
        nameLabel.text = workout.name
        
        let mostRecentDateString = "\(workout.mostRecent)"
        dateTagView.injectContent(icon: NRStyle.calendarIcon, text: mostRecentDateString)
        
        let numberOfExercises = "\(workout.exercises.count) " + "exercises.title".localized
        numberOfExercisesTagView.injectContent(icon: NRStyle.exercisesIcon, text: numberOfExercises)
        addCustomDisclosureIndicator()
        
        setupView()
    }
    
    private func setupView() {
        [nameLabel, dateTagView, numberOfExercisesTagView, startButton].forEach(contentView.addSubview)
        
        let padding = NRStyle.verticalPadding / 2
        nameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.centerYAnchor, trailing: startButton.leadingAnchor, padding: .init(top: padding, left: NRStyle.horizontalPadding, bottom: padding / 2, right: NRStyle.horizontalPadding))
        
        dateTagView.anchor(top: contentView.centerYAnchor, leading: nameLabel.leadingAnchor, bottom: contentView.bottomAnchor, padding: .init(top: padding / 2, left: 0, bottom: padding, right: 0))
        
        numberOfExercisesTagView.anchor(top: dateTagView.topAnchor, leading: dateTagView.trailingAnchor, bottom: dateTagView.bottomAnchor, padding: .init(top: 0, left: padding, bottom: 0, right: 0))
        
        startButton.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: padding, left: 0, bottom: padding, right: NRStyle.horizontalPadding * 3))
        startButton.widthAnchor.constraint(equalTo: startButton.heightAnchor).isActive = true
    }
    
    @objc
    private func handleStartWorkout() {
        
    }
}
