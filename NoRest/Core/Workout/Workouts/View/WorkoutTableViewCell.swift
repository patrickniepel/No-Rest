//
//  WorkoutTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class WorkoutTableViewCell: NRTableViewCell {
    private lazy var nameLabel: UILabel = .init()
    private lazy var dateTagView: NRTagView = .init()
    private lazy var numberOfExercisesTagView: NRTagView = .init()
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleStartWorkout), for: .touchUpInside)
        button.imageEdgeInsets = .init(top: 0, left: 3, bottom: 0, right: 0)
        button.layer.cornerRadius = 10
        button.applyShadow()
        return button
    }()

    private var workout: Workout?
    private var calendarIcon: UIImage?

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }

    func setup(with workout: Workout) {
        self.workout = workout
        nameLabel.text = workout.name

        addCustomDisclosureIndicator()
        setupView()

        guard let workoutTableViewCellTheme = (ThemeManager.default.theme as? ApplicationTheme)?.custom.workoutTableViewCellTheme else { return }

        let mostRecentDateString: String
        let template = "EyMMMMd"

        if let mostRecentDate = workout.mostRecent,
            let dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: .current) {

            mostRecentDateString = Date.withFormat(date: mostRecentDate, format: dateFormat)
        } else {
            mostRecentDateString = "workout.most.recent.never".localized
        }

        dateTagView.injectContent(icon: workoutTableViewCellTheme.calendarIcon, text: mostRecentDateString)

        let numberOfExercises = "\(workout.exercises.count)"
        numberOfExercisesTagView.injectContent(icon: workoutTableViewCellTheme.exercisesIcon, text: numberOfExercises)

    }

    private func setupView() {
        [nameLabel, dateTagView, numberOfExercisesTagView, startButton].forEach(contentView.addSubview)

        let padding = NRStyle.verticalPadding / 2
        nameLabel.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: contentView.centerYAnchor,
                         trailing: startButton.leadingAnchor,
                         padding: .init(top: padding, left: NRStyle.horizontalPadding, bottom: padding / 2, right: NRStyle.horizontalPadding))

        dateTagView.anchor(top: contentView.centerYAnchor,
                           leading: nameLabel.leadingAnchor,
                           bottom: contentView.bottomAnchor,
                           padding: .init(top: padding / 2, left: 0, bottom: padding, right: 0))

        numberOfExercisesTagView.anchor(top: dateTagView.topAnchor,
                                        leading: dateTagView.trailingAnchor,
                                        bottom: dateTagView.bottomAnchor,
                                        padding: .init(top: 0, left: padding, bottom: 0, right: 0))

        startButton.anchor(top: contentView.topAnchor,
                           bottom: contentView.bottomAnchor,
                           trailing: contentView.trailingAnchor,
                           padding: .init(top: padding * 1.5, left: 0, bottom: padding * 1.5, right: NRStyle.horizontalPadding * 3))

        startButton.widthAnchor.constraint(equalTo: startButton.heightAnchor).isActive = true
    }

    @objc
    private func handleStartWorkout() {
        guard let workout = workout else { return }
        let workoutSessionAction = WorkoutSessionAction(workout: workout)
        store.dispatch(workoutSessionAction)
        let routeAction = RouteAction(screen: .workoutSession, in: .workouts)
        store.dispatch(routeAction)
    }

    override func apply(theme: TableViewCellTheme) {
        super.apply(theme: theme)

        guard let workoutTableViewCellTheme = (ThemeManager.default.theme as? ApplicationTheme)?.custom.workoutTableViewCellTheme else { return }

        nameLabel.textColor = workoutTableViewCellTheme.textColor
        nameLabel.font = workoutTableViewCellTheme.textFont
        startButton.backgroundColor = workoutTableViewCellTheme.buttonColor
        startButton.setImage(workoutTableViewCellTheme.startIcon, for: .normal)
    }
}
