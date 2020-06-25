//
//  ExerciseTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class ExerciseTableViewCell: NRTableViewCell {
    private lazy var exerciseImageView: NRExerciseImageView = .init()

    private lazy var nameLabel: UILabel = .init()
    private lazy var timerTagView: NRTagView = .init()
    private lazy var notesAvailableTagView: NRTagView = .init()

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        exerciseImageView.image = nil
    }

    func setup(with exercise: Exercise) {
        exerciseImageView.image = exercise.icon
        nameLabel.text = exercise.name

        addCustomDisclosureIndicator()

        setupView()

        guard let exerciseTableViewCellTheme = (ThemeManager.default.theme as? ApplicationTheme)?.custom.exerciseTableViewCellTheme else { return }

        timerTagView.injectContent(icon: exerciseTableViewCellTheme.timerIcon, text: exercise.descriptiveRestTimer)

        notesAvailableTagView.isHidden = exercise.notes.isBlank

        if !exercise.notes.isBlank {
            notesAvailableTagView.injectContent(icon: exerciseTableViewCellTheme.notesIcon)
        }
    }

    private func setupView() {
        [exerciseImageView, timerTagView, notesAvailableTagView, nameLabel].forEach(contentView.addSubview)

        let size = contentView.bounds.height - NRStyle.verticalPadding
        exerciseImageView.anchor(leading: contentView.leadingAnchor,
                                 centerY: contentView.centerYAnchor,
                                 padding: .init(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0),
                                 size: .init(width: size, height: size))

        let padding = NRStyle.verticalPadding / 2
        nameLabel.anchor(top: exerciseImageView.topAnchor,
                         leading: exerciseImageView.trailingAnchor,
                         bottom: exerciseImageView.centerYAnchor,
                         trailing: contentView.trailingAnchor,
                         padding: .init(top: 0, left: padding, bottom: padding / 2, right: NRStyle.horizontalPadding * 2))

        timerTagView.anchor(top: contentView.centerYAnchor,
                            leading: nameLabel.leadingAnchor,
                            bottom: contentView.bottomAnchor,
                            padding: .init(top: padding / 2, left: 0, bottom: padding, right: 0))

        notesAvailableTagView.anchor(top: contentView.centerYAnchor,
                                     leading: timerTagView.trailingAnchor,
                                     bottom: contentView.bottomAnchor,
                                     padding: .init(top: padding / 2, left: padding, bottom: padding, right: 0))
    }

    override func apply(theme: TableViewCellTheme) {
        super.apply(theme: theme)

        nameLabel.textColor = theme.textColor
        nameLabel.font = theme.textFont
    }
}
