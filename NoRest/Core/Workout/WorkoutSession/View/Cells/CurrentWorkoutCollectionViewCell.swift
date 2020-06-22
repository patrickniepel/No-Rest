//
//  CurrentWorkoutCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

// swiftlint:disable trailing_whitespace
class CurrentWorkoutCollectionViewCell: UICollectionViewCell {
    
//    private let baseScrollView = UIScrollView()
//    private var baseStackView = UIStackView()
//    private var topButtonsStackView = UIStackView()
//    private var inputStackView = UIStackView()
//    private var inputLabelsStackView = UIStackView()
//    private var inputTextFieldsStackView = UIStackView()
//    private var tableViewStackView = UIStackView()
//    
//    enum ButtonTag: Int {
//        case notesButton = 1
//        case timerButton = 2
//        case actionButton = 3
//    }
//    
//    private let notesButton: UIButton = {
//        let button = UIButton()
//        button.setImage(NRStyle.notesIcon?.dye(NRStyle.complementaryColor), for: .normal)
//        button.backgroundColor = NRStyle.themeColor
//        button.tag = ButtonTag.notesButton.rawValue
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
//        return button
//    }()
//    
//    private let timerButton: UIButton = {
//        let button = UIButton()
//        button.setImage(NRStyle.timerIcon?.dye(NRStyle.complementaryColor), for: .normal)
//        button.backgroundColor = NRStyle.themeColor
//        button.tag = ButtonTag.timerButton.rawValue
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
//        return button
//    }()
//    
//    private let actionButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("button.title.add".localized, for: .normal)
//        button.backgroundColor = NRStyle.themeColor
//        button.tag = ButtonTag.actionButton.rawValue
//        button.titleLabel?.font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeLarge)
//        button.setTitleColor(NRStyle.complementaryColor, for: .normal)
//        return button
//    }()
//    
//    private let repsLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = NRStyle.primaryTextColor
//        label.font = UIFont(name: NRStyle.boldFont, size: 15)
//        label.textAlignment = .center
//        label.text = "NRConstants.Texts.reps"
//        return label
//    }()
//    
//    private let weightLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = NRStyle.primaryTextColor
//        label.font = UIFont(name: NRStyle.boldFont, size: 15)
//        label.textAlignment = .center
//        label.text = "NRConstants.Texts.weight +  (\(SettingsController.currentUnit.rawValue))"
//        return label
//    }()
//    
//    private let repsTextField: UITextField = {
//        let textField = UITextField()
//        textField.adjustsFontSizeToFitWidth = true
//        textField.borderStyle = .roundedRect
//        textField.font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeLarge)
//        textField.keyboardAppearance = .default
//        textField.keyboardType = .numberPad
//        textField.backgroundColor = NRStyle.themeColor
//        textField.tintColor = NRStyle.complementaryColor
//        textField.textColor = NRStyle.primaryTextColor
//        textField.textAlignment = .center
//        return textField
//    }()
//    
//    private let weightTextField: UITextField = {
//        let textField = UITextField()
//        textField.adjustsFontSizeToFitWidth = true
//        textField.borderStyle = .roundedRect
//        textField.font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeLarge)
//        textField.keyboardAppearance = .default
//        textField.keyboardType = .decimalPad
//        textField.backgroundColor = NRStyle.themeColor
//        textField.tintColor = NRStyle.complementaryColor
//        textField.textColor = NRStyle.primaryTextColor
//        textField.textAlignment = .center
//        return textField
//    }()
//    
//    private let timesImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = nil // NRConstants.Images.x.image?.dye(NRStyle.complementaryColor).withAlignmentRectInsets(UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10))
//        return imageView
//    }()
//    
//    private let setsLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = NRStyle.primaryTextColor
//        label.font = UIFont(name: NRStyle.boldFont, size: 15)
//        label.textAlignment = .center
//        label.text = "NRConstants.Texts.sets"
//        return label
//    }()
//    
//    let tableView: NRSetsTableView = {
//        let tableView = NRSetsTableView()
//        tableView.maxHeight = 300
//        tableView.register(NRSetsTableViewCell.self, forCellReuseIdentifier: "NRConstants.CellIdentifiers.nrSetsTableViewCell")
//        tableView.backgroundColor = NRStyle.themeColor
//        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 1))
//        tableView.setupDesign()
//        return tableView
//    }()
//    
//    private let labelHeight: CGFloat = 30
//    private var actionButtonState: ActionButtonState = .add
//    
//    enum ActionButtonState {
//        case add
//        case update
//    }
//
//    var exercise: Exercise?
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        repsTextField.text = nil
//        weightTextField.text = nil
//        changeActionButtonMode(to: .add)
//        if let selectedIndex = tableView.indexPathForSelectedRow {
//            tableView.deselectRow(at: selectedIndex, animated: false)
//        }
////        toggleTableStackViewVisibility(isHidden: exercise?.sets.count == 0)
//        
//        tableView.delegate = nil
//        tableView.dataSource = nil
//        tableView.reloadData()
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        setupDesign()
//    }
//
//    func setup(exercise: Exercise) {
//        subscribe()
//        
//        self.exercise = exercise
//            
//        setupLayout()
//        setupTargets()
//        setupTableView()
//        setupActionButton()
//    }
//    
//    private func setupDesign() {
//        notesButton.layer.cornerRadius = notesButton.bounds.width / 2
//        timerButton.layer.cornerRadius = notesButton.bounds.width / 2
//        notesButton.applyShadow()
//        timerButton.applyShadow()
//        
//        actionButton.layer.cornerRadius = 15
//        actionButton.applyShadow()
//    }
//    
//    private func setupTargets() {
//        [notesButton, timerButton, actionButton].forEach {
//            $0.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
//        }
//    }
//    
//    private func setupTableView() {
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//    
//    private func setupActionButton() {
//        if actionButtonState == .add {
//            actionButton.setTitle("button.title.add".localized, for: .normal)
//        } else if actionButtonState == .update {
//            actionButton.setTitle("button.title.update".localized, for: .normal)
//        }
//    }
//    
//    @objc
//    private func handleButtonTapped(sender: UIButton) {
//        switch sender.tag {
//
//        case ButtonTag.notesButton.rawValue:
//            handleNotesButton()
//
//        case ButtonTag.timerButton.rawValue:
//            handleTimerButton()
//
//        case ButtonTag.actionButton.rawValue:
//            handleActionButton()
//
//        default:
//            return
//        }
//    }
//    
//    private func handleNotesButton() {
//        let popUpAction = PopUpAction(type: .notes, exercise: exercise)
//        store.dispatch(popUpAction)
//        
//        let routeAction = RouteAction(screen: .popUp, in: .workouts, action: .modally)
//        store.dispatch(routeAction)
//    }
//    
//    private func handleTimerButton() {
//        let popUpAction = PopUpAction(type: .timer, exercise: exercise)
//        store.dispatch(popUpAction)
//        
//        let routeAction = RouteAction(screen: .popUp, in: .workouts, action: .modally)
//        store.dispatch(routeAction)
//    }
//    
//    private func handleActionButton() {
//        let set = setFromTextFields()
//        if actionButtonState == .add {
//            addSet(set)
//        } else if actionButtonState == .update {
//            updateSet(set)
//            changeActionButtonMode(to: .add)
//        }
//        clearTextFields()
//    }
//    
//    private func setFromTextFields() -> Set {
//        let reps = Int(repsTextField.text ?? "") ?? 0
//        let weight = Double(weightTextField.text ?? "") ?? 0
//        return Set(reps: reps, weight: weight)
//    }
//    
//    func fillTextFields(with set: Set) {
//        repsTextField.text = "\(set.reps)"
//        weightTextField.text = "\(set.weight)"
//    }
//    
//    func clearTextFields() {
//        repsTextField.text = nil
//        weightTextField.text = nil
//    }
//    
//    func toggleTableStackViewVisibility(isHidden: Bool) {
//        tableViewStackView.isHidden = isHidden
//    }
//    
//    func changeActionButtonMode(to state: ActionButtonState) {
//        actionButtonState = state
//        setupActionButton()
//    }
//
//    func updateExercise() {
//        if let currentWorkoutVC = self.presentingViewController as? CurrentWorkoutViewController,
//            let cellIndex = currentWorkoutVC.collectionView.indexPath(for: self)?.item,
//            let exercise = exercise {
//            
//            currentWorkoutVC.updateExercise(at: cellIndex, exercise: exercise)
//        }
//    }
//    
//    deinit {
//        unsubscribe()
//    }
//}
//
//private extension CurrentWorkoutCollectionViewCell {
//    
//    func setupLayout() {
//        contentView.addSubview(baseScrollView)
//        baseScrollView.fillSuperview()
//        
//        createStackViews()
//        baseScrollView.addSubview(baseStackView)
//        
//        setupBaseStackView()
//        setupTopButtonsStackView()
//        setupInputStackView()
//        setupActionButtonLayout()
//        setupTableViewStackView()
//    }
//    
//    func createStackViews() {
//        baseStackView = createStackView(distribution: .fill, axis: .vertical, spacing: 48)
//        topButtonsStackView = createStackView(distribution: .equalSpacing, axis: .horizontal)
//        inputStackView = createStackView(distribution: .fill, axis: .vertical)
//        inputLabelsStackView = createStackView(distribution: .fillEqually, axis: .horizontal)
//        inputTextFieldsStackView = createStackView(distribution: .fill, axis: .horizontal)
//        tableViewStackView = createStackView(distribution: .fill, axis: .vertical)
//    }
//    
//    func setupTopButtonsStackView() {
//        topButtonsStackView.addArrangedSubviews(notesButton, timerButton)
//        
//        topButtonsStackView.anchor(leading: baseStackView.leadingAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 72, bottom: 0, right: 72))
//        let buttonLength = 75
//        notesButton.anchor(size: CGSize(width: buttonLength, height: buttonLength))
//        timerButton.anchor(size: CGSize(width: buttonLength, height: buttonLength))
//    }
//    
//    func setupInputStackView() {
//        inputStackView.addArrangedSubviews(inputLabelsStackView, inputTextFieldsStackView)
//        
//        //Labels
//        inputLabelsStackView.addArrangedSubviews(repsLabel, weightLabel)
//        
//        repsLabel.anchor(size: CGSize(width: 0, height: labelHeight))
//        weightLabel.anchor(size: CGSize(width: 0, height: labelHeight))
//        
//        //TextFields
//        
//        inputTextFieldsStackView.addArrangedSubviews(repsTextField, timesImageView, weightTextField)
//        
//        let textFieldHeight = 50
//        repsTextField.anchor(size: CGSize(width: 0, height: textFieldHeight))
//        weightTextField.anchor(size: CGSize(width: 0, height: textFieldHeight))
//        timesImageView.anchor(centerX: inputTextFieldsStackView.centerXAnchor, size: CGSize(width: textFieldHeight, height: textFieldHeight))
//        
//        //StackVies
//        inputLabelsStackView.anchor(leading: inputStackView.leadingAnchor, trailing: inputStackView.trailingAnchor)
//        inputTextFieldsStackView.anchor(leading: inputStackView.leadingAnchor,
//                                        trailing: inputStackView.trailingAnchor,
//                                        padding: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32))
//        inputStackView.anchor(leading: baseStackView.leadingAnchor, trailing: baseStackView.trailingAnchor)
//    }
//    
//    func setupActionButtonLayout() {
//        actionButton.anchor(size: CGSize(width: bounds.width / 2, height: 0))
//    }
//    
//    func setupTableViewStackView() {
//        tableViewStackView.addArrangedSubviews(setsLabel, tableView)
//
//        setsLabel.anchor(leading: tableViewStackView.leadingAnchor, trailing: tableViewStackView.trailingAnchor, size: CGSize(width: 0, height: labelHeight))
//        tableView.anchor(leading: tableViewStackView.leadingAnchor, trailing: tableViewStackView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
//        tableViewStackView.anchor(leading: baseStackView.leadingAnchor, trailing: baseStackView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32))
//    }
//    
//    func setupBaseStackView() {
//        baseStackView.addArrangedSubviews(topButtonsStackView, inputStackView, actionButton, tableViewStackView)
//        baseStackView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
//    }
//    
//    func createStackView(alignment: UIStackView.Alignment = .center, distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0) -> UIStackView {
//        let stackView = UIStackView()
//        stackView.alignment = alignment
//        stackView.distribution = distribution
//        stackView.axis = axis
//        stackView.spacing = spacing
//        return stackView
//    }
}
