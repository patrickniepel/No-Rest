//
//  MyWorkoutCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel: NRLabel = {
        let label = NRLabel(with: "", size: .fontSizeLarge)
        return label
    }()
    
    private let dateLabel: NRLabel = {
        let label = NRLabel(with: "")
        return label
    }()
    
    private let dateImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "date"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "edit"), for: .normal)
        button.addTarget(self, action: #selector(editWorkout), for: .touchUpInside)
        return button
    }()
    
    private lazy var binButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "bin"), for: .normal)
        button.addTarget(self, action: #selector(deleteWorkout), for: .touchUpInside)
        return button
    }()
    
    private var workout: MyWorkout?
    private let myWorkoutCtrl = MyWorkoutController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(for workout: MyWorkout) {
        self.workout = workout
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
        addSubview(dateLabel)
        addSubview(dateImage)
        addSubview(binButton)
        addSubview(editButton)
        
        let labelHeight = contentView.frame.height / 2
        let dateHeight = contentView.frame.height / 2 - 24
        
        nameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: labelHeight))
        
        editButton.anchor(top: nil, leading: nameLabel.trailingAnchor, bottom: nil, trailing: contentView.trailingAnchor, centerY: nameLabel.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), size: CGSize(width: dateHeight / 1.5, height: dateHeight / 1.5))
        
        dateImage.anchor(top: nameLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 0), size: CGSize(width: dateHeight, height: dateHeight))
        
        binButton.anchor(top: nil, leading: nil, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 16), size: CGSize(width: dateHeight / 1.5, height: dateHeight / 1.5))
        
        dateLabel.anchor(top: nameLabel.bottomAnchor, leading: dateImage.trailingAnchor, bottom: contentView.bottomAnchor, trailing: binButton.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    private func fillLayout() {
        guard let workout = workout else { return }
        nameLabel.text = workout.name
        
        let dateString = myWorkoutCtrl.dateAsString(for: workout.date)
        
        if dateString.isEmpty {
            dateImage.removeFromSuperview()
        } else {
            dateLabel.text = dateString
        }
    }
    
    @objc private func editWorkout() {
        guard let workout = workout else { return }
        let editWorkoutAction = WorkoutSettingAction(workout: workout)
        store.dispatch(editWorkoutAction)
        
        let routeAction = RouteAction(screen: .workoutSetting, in: .myWorkout)
        store.dispatch(routeAction)
    }
    
    @objc func deleteWorkout() {
        if let workout = workout,
            let collectionView = self.superview as? UICollectionView,
            let indexPath = collectionView.indexPath(for: self) {
            
            //update collectionView
            myWorkoutCtrl.deleteWorkout(workout)
            collectionView.deleteItems(at: [indexPath])
            collectionView.reloadData()
        }
    }
}
