//
//  NRItemCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRItemCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel: NRLabel = {
        let label = NRLabel(size: .fontSizeLarge)
        return label
    }()
    
    private let infoLabel: NRLabel = {
        let label = NRLabel()
        label.textColor = .black
        return label
    }()
    
    private let infoImageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let actionView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.opacity = 0
        return view
    }()
    
    private let actionImageView: UIImageView = {
        let view = UIImageView(image: nil)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    enum CellType {
        case workout
        case exercise
    }
    
    private var cellType: CellType = .workout
    
    private var workout: MyWorkout?
    private lazy var myWorkoutCtrl = MyWorkoutController()
    
    private var exercise: Exercise?
    private lazy var exerciseCtrl = ExerciseController()
    
    private var pan: UIPanGestureRecognizer!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        infoLabel.text = nil
        infoImageView.image = nil
        actionImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if pan.state == .changed {
            repositionContent()
        }
    }
    
    func setup<T>(item: T) {
        if let workout = item as? MyWorkout {
            self.workout = workout
            cellType = .workout
        }
        if let exercise = item as? Exercise {
            self.exercise = exercise
            cellType = .exercise
        }
        
        setupLayout()
        fillLayout()
        setupDesign()
        
        pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        pan.delegate = self
        addGestureRecognizer(pan)
    }
    
    private func setupDesign() {
        contentView.backgroundColor = .backgroundColorUIControl
        contentView.layer.cornerRadius = contentView.bounds.width / 15
        contentView.clipsToBounds = true
        applyShadow()
    }

    private func fillLayout() {
        if cellType == .workout {
            fillWorkout()
        }
        else if cellType == .exercise {
            fillExercise()
        }
    }
    
    private func fillWorkout() {
        guard let workout = workout else { return }
        nameLabel.text = workout.name
        infoLabel.text = myWorkoutCtrl.dateAsString(for: workout.date)
        infoImageView.image = NRConstants.Images.date.image
    }
    
    private func fillExercise() {
        guard let exercise = exercise else { return }
        infoLabel.text = exercise.timer.displayValue
        nameLabel.text = exercise.name
        infoImageView.image = NRConstants.Images.timer.image?.dye(.black)
    }
    
    private func deleteItem() {
        guard let collectionView = self.superview as? UICollectionView,
            let indexPath = collectionView.indexPath(for: self)
        else { return }
        
        if cellType == .workout {
            guard let vc = self.presentingViewController as? MyWorkoutCollectionViewController else { return }
            vc.deleteWorkout(at: indexPath)
        }
        else if cellType == .exercise {
            guard let vc = self.presentingViewController as? ExercisesCollectionViewController else { return }
            vc.deleteExercise(at: indexPath)
        }
        
    }
    
    private func startWorkout() {
        guard let currentWorkout = workout else { return }
        
        let currentWorkoutAction = CurrentWorkoutAction(myWorkout: currentWorkout)
        store.dispatch(currentWorkoutAction)
        
        let routeAction = RouteAction(screen: .currentWorkout, in: .myWorkout)
        store.dispatch(routeAction)
    }
    
    deinit {
        removeGestureRecognizer(pan)
    }
}

//Layout
private extension NRItemCollectionViewCell {
    func setupLayout() {
        contentView.addSubviews(nameLabel, infoLabel, infoImageView)
        
        let labelHeight = contentView.bounds.height / 2 - 8
        
        nameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: labelHeight))
        
        infoImageView.anchor(top: nil, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, centerY: infoLabel.centerYAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0))
        
        let multiplier: CGFloat = cellType == .workout ? 0.5 : 0.7
        infoImageView.heightAnchor.constraint(equalTo: infoLabel.heightAnchor, multiplier: multiplier).isActive = true
        infoImageView.widthAnchor.constraint(equalTo: infoImageView.heightAnchor, multiplier: 1).isActive = true
        
        infoLabel.anchor(top: nameLabel.bottomAnchor, leading: infoImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 16))
        
        contentView.addSubview(actionView)
        actionView.fillSuperview()
        
        actionView.addSubview(actionImageView)
        actionImageView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0))
    }
}

//Repositioning
private extension NRItemCollectionViewCell {
    func repositionContent() {
        let p: CGPoint = pan.translation(in: self)
        let width = self.contentView.frame.width
        let height = self.contentView.frame.height
        var image: UIImage?
        
        if p.x > 0 && cellType == .exercise {
            return
        }
        else if p.x > 0 { // Start Workout
            actionView.backgroundColor = .successColor
            image = NRConstants.Images.play.image
        }
        else if p.x < 0 { // Delete Item
            actionView.backgroundColor = .deleteColor
            image = NRConstants.Images.bin.image
        }
        actionImageView.image = image
        actionView.layer.opacity = Float(abs(p.x / (contentView.bounds.width / 1.25)))
        self.contentView.frame = CGRect(x: p.x,y: 0, width: width, height: height)
        
        if pan.velocity(in: self).x < -1600 {
            deleteItem()
        } else if pan.velocity(in: self).x > 1600 && cellType == .workout {
            startWorkout()
        }
    }
    
    @objc func handlePan(pan: UIPanGestureRecognizer) {
        
        if pan.state == UIGestureRecognizer.State.changed {
            setNeedsLayout()
        }
        else if pan.state == .ended || pan.state == .cancelled {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.setNeedsLayout()
                self?.actionView.backgroundColor = .clear
                self?.actionView.layer.opacity = 0
                self?.layoutIfNeeded()
            })
        }
    }
}

extension NRItemCollectionViewCell: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return abs((pan.velocity(in: pan.view)).x) > abs((pan.velocity(in: pan.view)).y)
    }
}
