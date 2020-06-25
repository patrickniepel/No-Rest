//
//  NRExerciseImageView.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRExerciseImageView: UIView, Themeable {
    typealias Theme = ExerciseImageViewTheme

    var image: UIImage? {
        get {
            exerciseImageView.image
        }
        set {
            exerciseImageView.image = newValue
        }
    }

    private lazy var exerciseImageView: NRImageView = .init()

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.custom.exerciseImageViewTheme)

        layer.cornerRadius = 5

        addSubview(exerciseImageView)
        let padding = NRStyle.verticalPadding / 2
        exerciseImageView.fillSuperview(padding: .init(top: padding, left: padding, bottom: padding, right: padding))
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
    }
}
