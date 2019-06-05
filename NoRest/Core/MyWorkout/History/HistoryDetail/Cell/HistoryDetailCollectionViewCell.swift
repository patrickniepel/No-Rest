//
//  HistoryDetailCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryDetailCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel: NRLabel = {
        let label = NRLabel()
        label.textAlignment = .center
        return label
    }()
    
    private let exerciseContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColorUIControl
        return view
    }()
    
    private var exercise: Exercise?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        exercise = nil
    }
    
    func setup(with exercise: Exercise) {
        self.exercise = exercise
        setupLayout()
        nameLabel.text = exercise.name
        setupExerciseContentView()
        setupDesign()
    }
    
    func setupDesign() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 25
        applyShadow()
        contentView.backgroundColor = .backgroundColorUIControl
    }
    
    private func setupExerciseContentView() {
        guard let exercise = exercise else { return }
        
        let view: UIView
        if exercise.category == .cardio {
            view = HistoryDetailCardioView(timerValue: exercise.timer.displayValue)
        } else {
            view = HistoryDetailSetsView(sets: exercise.sets)
        }
        
        exerciseContentView.addSubview(view)
        view.fillSuperview()
    }
}

private extension HistoryDetailCollectionViewCell {
    
    func setupLayout() {
        contentView.addSubviews(nameLabel, exerciseContentView)
        
        nameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 30))
        
        exerciseContentView.anchor(top: nameLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 32, bottom: 32, right: 32))
    }
}
