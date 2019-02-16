//
//  ExercisesCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel: NRLabel = {
        let label = NRLabel(with: "", size: .fontSizeLarge)
        return label
    }()
    
    private let timerLabel: NRLabel = {
        let label = NRLabel(with: "")
        return label
    }()
    
    private let timerImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "timer"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var binButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "bin"), for: .normal)
        button.addTarget(self, action: #selector(deleteExercise), for: .touchUpInside)
        return button
    }()
    
    private var exercise: Exercise?
    private let exerciseCtrl = ExerciseController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(for exercise: Exercise) {
        self.exercise = exercise
        setupDesign()
        setupLayout()
        fillLayout()
    }
    
    private func setupDesign() {
        contentView.backgroundColor = .lightBackgroundColor
        contentView.layer.cornerRadius = 25
        contentView.applyShadow()
    }
    
    private func setupLayout() {
        addSubview(nameLabel)
        addSubview(timerLabel)
        addSubview(timerImage)
        addSubview(binButton)

        let labelHeight = contentView.frame.height / 2
        nameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: labelHeight))
        
        let timerHeight = contentView.frame.height / 2 - 24
        timerImage.anchor(top: nameLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 0), size: CGSize(width: timerHeight, height: timerHeight))
        
        binButton.anchor(top: nil, leading: nil, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 16), size: CGSize(width: timerHeight / 1.5, height: timerHeight / 1.5))
        
        timerLabel.anchor(top: nameLabel.bottomAnchor, leading: timerImage.trailingAnchor, bottom: contentView.bottomAnchor, trailing: binButton.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    private func fillLayout() {
        if let exercise = exercise {
            timerLabel.text = exerciseCtrl.timerAsString(for: exercise)
            nameLabel.text = exercise.name
        }
    }
    
    @objc func deleteExercise() {
        if let exercise = exercise,
            let collectionView = self.superview as? UICollectionView,
            let indexPath = collectionView.indexPath(for: self) {
            
            //update collectionView
            collectionView.deleteItems(at: [indexPath])
            exerciseCtrl.deleteExercise(exercise)
            collectionView.reloadData()
        }
    }
}
