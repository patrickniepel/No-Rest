//
//  ExerciseSelectionTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseSelectionTableViewCell: NRTableViewCell {
    private lazy var exerciseImageView: NRExerciseImageView = .init()
    private lazy var nameLabel: UILabel = .init()

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        exerciseImageView.image = nil
    }

    func setup(with exercise: Exercise, accessoryType: AccessoryType) {
        self.accessoryType = accessoryType
        exerciseImageView.image = exercise.icon
        nameLabel.text = exercise.name

        setupView()
    }

    private func setupView() {
        [exerciseImageView, nameLabel].forEach(contentView.addSubview)

        let size = contentView.bounds.height - NRStyle.verticalPadding
        exerciseImageView.anchor(leading: contentView.leadingAnchor,
                                 centerY: contentView.centerYAnchor,
                                 padding: .init(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0),
                                 size: .init(width: size, height: size))

        nameLabel.anchor(leading: exerciseImageView.trailingAnchor,
                         trailing: contentView.trailingAnchor,
                         centerY: contentView.centerYAnchor,
                         padding: .init(top: 0, left: NRStyle.verticalPadding / 2, bottom: 0, right: NRStyle.horizontalPadding))
    }

    override func apply(theme: TableViewCellTheme) {
        super.apply(theme: theme)

        nameLabel.textColor = theme.textColor
        nameLabel.font = theme.textFont
    }
}
