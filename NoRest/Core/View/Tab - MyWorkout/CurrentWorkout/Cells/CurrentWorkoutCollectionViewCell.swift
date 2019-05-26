//
//  CurrentWorkoutCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutCollectionViewCell: UICollectionViewCell {
    
    enum ButtonTag: Int {
        case notesButton = 1
        case timerButton = 2
        case actionButton = 3
    }
    
    private let notesButton: UIButton = {
        let button = UIButton()
        button.setImage(NRConstants.Images.notes.image?.dye(.uiControl), for: .normal)
        button.backgroundColor = .backgroundColorUIControl
        button.tag = ButtonTag.notesButton.rawValue
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return button
    }()
    
    private let timerButton: UIButton = {
        let button = UIButton()
        button.setImage(NRConstants.Images.timer.image?.dye(.uiControl), for: .normal)
        button.backgroundColor = .backgroundColorUIControl
        button.tag = ButtonTag.timerButton.rawValue
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        return button
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle(NRConstants.ButtonTitles.add, for: .normal)
        button.backgroundColor = .backgroundColorUIControl
        button.tag = ButtonTag.actionButton.rawValue
        button.titleLabel?.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeLarge)
        button.setTitleColor(.uiControl, for: .normal)
        return button
    }()
    
    private let baseStackView = { UIStackView() }()
    private let topButtonsStackView = { UIStackView() }()
    private let inputStackView = { UIStackView() }()
    private let tablViewStackView = { UIStackView() }()
    
    private var exercise: Exercise?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupDesign()
    }
    
    func setup(exercise: Exercise) {
        subscribe()
        self.exercise = exercise
        setupLayout()
        setupTargets()
    }
    
    private func setupDesign() {
        notesButton.layer.cornerRadius = notesButton.bounds.width / 2
        timerButton.layer.cornerRadius = notesButton.bounds.width / 2
        notesButton.applyShadow()
        timerButton.applyShadow()
    }
    
    private func setupTargets() {
        [notesButton, timerButton, actionButton].forEach {
            $0.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        }
    }
    
    func updateExercise(exercise: Exercise?) {
        self.exercise = exercise
        
        //Update datasource items
    }
    
    @objc private func handleButtonTapped(sender: UIButton) {
        switch sender.tag {
        case ButtonTag.notesButton.rawValue: handleNotesButton()
        case ButtonTag.timerButton.rawValue: handleTimerButton()
        case ButtonTag.actionButton.rawValue: handleActionButton()
        default: return
        }
    }
    
    private func handleNotesButton() {
        let popUpAction = PopUpAction(type: .notes, exercise: exercise)
        store.dispatch(popUpAction)
        
        let routeAction = RouteAction(screen: .popUp, in: .myWorkout, action: .modally)
        store.dispatch(routeAction)
    }
    
    private func handleTimerButton() {
        let popUpAction = PopUpAction(type: .timer, exercise: exercise)
        store.dispatch(popUpAction)
        
        let routeAction = RouteAction(screen: .popUp, in: .myWorkout, action: .modally)
        store.dispatch(routeAction)
    }
    
    private func handleActionButton() {
        
    }
    
    deinit {
        unsubscribe()
    }
}

extension CurrentWorkoutCollectionViewCell {
    
    private func setupLayout() {
        contentView.addSubview(baseStackView)
        setupBaseStackView()
        setupTopButtonsStackView()
        setupInputStackView()
        setupTableViewStackView()
    }
    
    private func setupTopButtonsStackView() {
        topButtonsStackView.alignment = .center
        topButtonsStackView.distribution = .equalSpacing
        topButtonsStackView.axis = .horizontal
        topButtonsStackView.addArrangedSubviews(notesButton, timerButton)
        
        topButtonsStackView.anchor(leading: baseStackView.leadingAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 72, bottom: 0, right: 72))
        let buttonLength = 75
        notesButton.anchor(size: CGSize(width: buttonLength, height: buttonLength))
        timerButton.anchor(size: CGSize(width: buttonLength, height: buttonLength))
    }
    
    private func setupInputStackView() {
        
    }
    
    private func setupTableViewStackView() {
        
    }
    
    private func setupBaseStackView() {
        baseStackView.axis = .vertical
        baseStackView.alignment = .center
        baseStackView.distribution = .fill
        baseStackView.addArrangedSubviews(topButtonsStackView, inputStackView, actionButton, tablViewStackView)
        baseStackView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
}
