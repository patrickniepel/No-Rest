//
//  CurrentWorkoutCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutCollectionViewCell: UICollectionViewCell {
    
    private let notesButton = LayoutContent.notesButton
    private let timerButton = LayoutContent.timerButton
    private let actionButton = LayoutContent.actionButton
    private let repsLabel = LayoutContent.repsLabel
    private let weightLabel = LayoutContent.weightLabel
    private let repsTextField = LayoutContent.repsTextField
    private let timesImageView = LayoutContent.timesImageView
    private let weightTextField = LayoutContent.weightTextField
    private let setsLabel = LayoutContent.setsLabel
    let tableView = LayoutContent.tableView
    
    private let baseScrollView = UIScrollView()
    private let baseStackView = LayoutContent.baseStackView
    private let topButtonsStackView = LayoutContent.topButtonsStackView
    private let inputStackView = LayoutContent.inputStackView
    private let inputLabelsStackView = LayoutContent.inputLabelsStackView
    private let inputTextFieldsStackView = LayoutContent.inputTextFieldsStackView
    private let tableViewStackView = LayoutContent.tableViewStackView
    
    private let labelHeight: CGFloat = 30
    private var actionButtonState: ActionButtonState = .add
    
    enum ActionButtonState {
        case add
        case update
    }
    
    var exercise: Exercise?
    
    override func prepareForReuse() {
        baseStackView.removeFromSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupDesign()
    }
    
    func setup(exercise: Exercise) {
        subscribe()
        self.exercise = exercise
        setupLayout()
        setupTargets()
        setupTableView()
        setupActionButton()
    }
    
    private func setupDesign() {
        notesButton.layer.cornerRadius = notesButton.bounds.width / 2
        timerButton.layer.cornerRadius = notesButton.bounds.width / 2
        notesButton.applyShadow()
        timerButton.applyShadow()
        
        actionButton.layer.cornerRadius = 15
        actionButton.applyShadow()
        
        weightLabel.text = NRConstants.Texts.weight + " (\(SettingsController.currentUnit.rawValue))"
        
        tableView.backgroundColor = .backgroundColorMain
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 1))
    }
    
    private func setupTargets() {
        [notesButton, timerButton, actionButton].forEach {
            $0.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupActionButton() {
        if actionButtonState == .add {
            actionButton.setTitle(NRConstants.ButtonTitles.add, for: .normal)
        } else if actionButtonState == .update {
            actionButton.setTitle(NRConstants.ButtonTitles.update, for: .normal)
        }
    }
    
    func updateExercise(exercise: Exercise?) {
        self.exercise = exercise
        
        //Update datasource items
    }
    
    @objc private func handleButtonTapped(sender: UIButton) {
        switch sender.tag {
        case LayoutContent.ButtonTag.notesButton.rawValue: handleNotesButton()
        case LayoutContent.ButtonTag.timerButton.rawValue: handleTimerButton()
        case LayoutContent.ButtonTag.actionButton.rawValue: handleActionButton()
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
        if actionButtonState == .add {
            let reps = Int(repsTextField.text!)!
            let weight = Double(weightTextField.text!)!
            let set = Set(reps: reps, weight: weight)
            addSet(set)
        } else if actionButtonState == .update {
            
        }
        clearTextFields()
    }
    
    func fillTextFields(with set: Set) {
        repsTextField.text = "\(set.reps)"
        weightTextField.text = "\(set.weight)"
    }
    
    func clearTextFields() {
        repsTextField.text = nil
        weightTextField.text = nil
    }
    
    func toggleTableStackViewVisibility(isHidden: Bool) {
        tableViewStackView.isHidden = isHidden
    }
    
    deinit {
        unsubscribe()
    }
}

extension CurrentWorkoutCollectionViewCell {
    
    private func setupLayout() {
        contentView.addSubview(baseScrollView)
        baseScrollView.fillSuperview()
        baseScrollView.addSubview(baseStackView)
        
        setupBaseStackView()
        setupTopButtonsStackView()
        setupInputStackView()
        setupActionButtonLayout()
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
        inputStackView.alignment = .center
        inputStackView.distribution = .fill
        inputStackView.axis = .vertical
        inputStackView.addArrangedSubviews(inputLabelsStackView, inputTextFieldsStackView)
        
        //Labels
        inputLabelsStackView.alignment = .center
        inputLabelsStackView.distribution = .fillEqually
        inputLabelsStackView.axis = .horizontal
        inputLabelsStackView.addArrangedSubviews(repsLabel, weightLabel)
        
        repsLabel.anchor(size: CGSize(width: 0, height: labelHeight))
        weightLabel.anchor(size: CGSize(width: 0, height: labelHeight))
        
        //TextFields
        inputTextFieldsStackView.alignment = .center
        inputTextFieldsStackView.distribution = .fill
        inputTextFieldsStackView.axis = .horizontal
        inputTextFieldsStackView.addArrangedSubviews(repsTextField, timesImageView, weightTextField)
        
        let textFieldHeight = 50
        repsTextField.anchor(size: CGSize(width: 0, height: textFieldHeight))
        weightTextField.anchor(size: CGSize(width: 0, height: textFieldHeight))
        timesImageView.anchor(centerX: inputTextFieldsStackView.centerXAnchor, size: CGSize(width: textFieldHeight, height: textFieldHeight))
        
        //StackVies
        inputLabelsStackView.anchor(leading: inputStackView.leadingAnchor, trailing: inputStackView.trailingAnchor)
        inputTextFieldsStackView.anchor(leading: inputStackView.leadingAnchor, trailing: inputStackView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32))
        inputStackView.anchor(leading: baseStackView.leadingAnchor, trailing: baseStackView.trailingAnchor)
    }
    
    private func setupActionButtonLayout() {
        actionButton.anchor(size: CGSize(width: bounds.width / 2, height: 0))
    }
    
    private func setupTableViewStackView() {
        tableViewStackView.alignment = .center
        tableViewStackView.distribution = .fill
        tableViewStackView.axis = .vertical
        tableViewStackView.addArrangedSubviews(setsLabel, tableView)

        setsLabel.anchor(leading: tableViewStackView.leadingAnchor, trailing: tableViewStackView.trailingAnchor, size: CGSize(width: 0, height: labelHeight))
        tableView.anchor(leading: tableViewStackView.leadingAnchor, trailing: tableViewStackView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        tableViewStackView.anchor(leading: baseStackView.leadingAnchor, trailing: baseStackView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32))
    }
    
    private func setupBaseStackView() {
        baseStackView.axis = .vertical
        baseStackView.alignment = .center
        baseStackView.distribution = .fill
        baseStackView.spacing = 48
        baseStackView.addArrangedSubviews(topButtonsStackView, inputStackView, actionButton, tableViewStackView)
        baseStackView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
}

fileprivate struct LayoutContent {
    
    static let baseStackView = UIStackView()
    static let topButtonsStackView = UIStackView()
    static let inputStackView = UIStackView()
    static let inputLabelsStackView = UIStackView()
    static let inputTextFieldsStackView = UIStackView()
    static let tableViewStackView = UIStackView()
    
    enum ButtonTag: Int {
        case notesButton = 1
        case timerButton = 2
        case actionButton = 3
    }
    
    static let notesButton: UIButton = {
        let button = UIButton()
        button.setImage(NRConstants.Images.notes.image?.dye(.uiControl), for: .normal)
        button.backgroundColor = .backgroundColorUIControl
        button.tag = ButtonTag.notesButton.rawValue
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return button
    }()
    
    static let timerButton: UIButton = {
        let button = UIButton()
        button.setImage(NRConstants.Images.timer.image?.dye(.uiControl), for: .normal)
        button.backgroundColor = .backgroundColorUIControl
        button.tag = ButtonTag.timerButton.rawValue
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        return button
    }()
    
    static let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle(NRConstants.ButtonTitles.add, for: .normal)
        button.backgroundColor = .backgroundColorUIControl
        button.tag = ButtonTag.actionButton.rawValue
        button.titleLabel?.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeLarge)
        button.setTitleColor(.uiControl, for: .normal)
        return button
    }()
    
    static let repsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 15)
        label.textAlignment = .center
        label.text = NRConstants.Texts.reps
        return label
    }()
    
    static let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 15)
        label.textAlignment = .center
        label.text = NRConstants.Texts.weight + " (\(SettingsController.currentUnit.rawValue))"
        return label
    }()
    
    static let repsTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeLarge)
        textField.keyboardAppearance = .default
        textField.keyboardType = .numberPad
        textField.backgroundColor = .backgroundColorUIControl
        textField.tintColor = .uiControl
        textField.textAlignment = .center
        return textField
    }()
    
    static let weightTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeLarge)
        textField.keyboardAppearance = .default
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .backgroundColorUIControl
        textField.tintColor = .uiControl
        textField.textAlignment = .center
        return textField
    }()
    
    static let timesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = NRConstants.Images.x.image?.dye(.uiControl).withAlignmentRectInsets(UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10))
        return imageView
    }()
    
    static let setsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 15)
        label.textAlignment = .center
        label.text = NRConstants.Texts.sets
        return label
    }()
    
    static let tableView: SetsTableView = {
        let tableView = SetsTableView()
        tableView.register(SetsTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.setsTableViewCell)
        return tableView
    }()
}
