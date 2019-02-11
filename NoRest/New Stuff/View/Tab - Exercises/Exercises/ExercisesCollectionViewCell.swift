//
//  ExercisesCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCollectionViewCell: UICollectionViewCell {
    
    private var exercise: Exercise?
    
    private lazy var nameLabel: NRLabel = {
        let label = NRLabel(with: exercise?.name ?? "Error", size: .fontSizeLarge)
        return label
    }()
    
    private lazy var timerLabel: NRLabel = {
        let timerAsString = "\(exercise?.restTimer ?? 0)" + "s"
        let label = NRLabel(with: timerAsString)
        return label
    }()
    
    private let timerImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "timer"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let binButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "bin"), for: .normal)
        button.addTarget(self, action: #selector(deleteExercise), for: .touchUpInside)
        return button
    }()
    
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
    }
    
    private func setupDesign() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 25
        contentView.layer.shadowColor = UIColor.mainColor.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 10)
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.shadowRadius = 10
        contentView.layer.masksToBounds = false
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
    
    @objc func deleteExercise() {
        print("Delete")
        if let exercise = exercise {
            ExerciseController(exercise: exercise).deleteExercise()
            
            //update collectionView
            let collectionView = self.superview as? UICollectionView
            collectionView?.reloadData()
        }
    }
}
