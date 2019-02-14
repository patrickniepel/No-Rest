//
//  EditExerciseViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit
import SCLAlertView

class EditExerciseViewController: UIViewController, UITextViewDelegate {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBackgroundColor
        view.applyShadow()
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let nameLabel: NRLabel = {
        let label = NRLabel(with: NRConstants.ExerciseEditing.nameLabel)
        label.textColor = .textColorMediumLight
        label.sizeToFit()
        return label
    }()
    
    private let timerLabel: NRLabel = {
        let label = NRLabel(with: "")
        label.textColor = .textColorMediumLight
        label.sizeToFit()
        return label
    }()
    
    private let notesLabel: NRLabel = {
        let label = NRLabel(with: NRConstants.ExerciseEditing.notesLabel)
        label.textColor = .textColorMediumLight
        label.sizeToFit()
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .default
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Text.font, size: .fontSizeRegular)
        textField.keyboardAppearance = .default
        textField.keyboardType = .default
        return textField
    }()
    
    private let timerTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Text.font, size: .fontSizeRegular)
        textField.keyboardAppearance = .default
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let notesTextView: UITextView = {
        let textView = UITextView()
        textView.autocapitalizationType = .sentences
        textView.autocorrectionType = .default
        textView.font = UIFont(name: NRConstants.Text.font, size: .fontSizeRegular)
        textView.isEditable = true
        textView.keyboardAppearance = .default
        textView.keyboardType = .default
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
    }()
    
    private let typeSegmentedControl: UISegmentedControl = {
        let items: [String] = [ExerciseType.weightLifting.rawValue, ExerciseType.cardio.rawValue]
        let control = UISegmentedControl(items: items)
        control.tintColor = .shadowColor
        control.isUserInteractionEnabled = true
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(exerciseTypeChanged), for: .valueChanged)
        return control
    }()
    
    var exercise: Exercise?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select {
                $0.editExerciseState
            }
        }
        notesTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupNavigationBar()
        view.setupDefaultBackgroundColor()
        hideKeyboardWhenTapped()
        setupLayout()
        fillLayout()
    }
    
    private func setupNavigationBar() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveExercise))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func fillLayout() {
        guard let exercise = exercise else { return }
        typeSegmentedControl.selectedSegmentIndex = ExerciseType.allCases.firstIndex(of: exercise.type) ?? 0
        timerLabel.text = exercise.type == .weightLifting ? NRConstants.ExerciseEditing.restTimerLabel : NRConstants.ExerciseEditing.runningTimerLabel
        nameTextField.text = exercise.name
        timerTextField.text = "\(exercise.timer)"
        notesTextView.text = exercise.notes
    }
    
    func setupExercise(_ exercise: Exercise?, for category: Category?) {
        if let exercise = exercise {
            self.exercise = exercise
        } else if let category = category {
            self.exercise = Exercise(name: "", category: category)
        }
        navigationItem.title = exercise?.name ?? NRConstants.ScreenTitles.newExercise
    }
    
    @objc private func saveExercise() {
        guard var exercise = exercise else {
            AlertController.showSavingFailureAlert()
            return
        }
        let exerciseCtrl = ExerciseController()
        exercise.name = exerciseCtrl.checkNameInputCorrect(text: nameTextField.text)
        exercise.timer = exerciseCtrl.checkTimerInputCorrect(text: timerTextField.text)
        exercise.notes = exerciseCtrl.checkNotesInputCorrect(text: notesTextView.text)
        exerciseCtrl.saveExercise(exercise)
        AlertController.showSavingSuccessAlert()
        navigationController?.popViewController(animated: true)
        
        // reload collection view
        let reloadAction = ReloadExercisesAction()
        store.dispatch(reloadAction)
    }
    
    @objc private func exerciseTypeChanged(sender: UISegmentedControl) {
        if let title = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            let newType = ExerciseType(rawValue: title) ?? .weightLifting
            exercise?.type = newType
            timerLabel.text = newType == .weightLifting ? NRConstants.ExerciseEditing.restTimerLabel : NRConstants.ExerciseEditing.runningTimerLabel
        }
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if !notesTextView.isFirstResponder {
            return
        }
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.scrollView.frame.origin.y == 0 {
                self.scrollView.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.scrollView.frame.origin.y != 0 {
           self.scrollView.frame.origin.y = 0
        }
    }
    
    deinit {
        store.unsubscribe(self)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension EditExerciseViewController {
    private func setupLayout() {
        setupScrollView()
        setupMainView()
        setupSegmentedControl()
        setupLabels()
        setupTextInputs()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
 
    private func setupMainView() {
        scrollView.addSubview(mainView)
        
        let mainViewHeight = view.frame.height - 2 * .defaultPadding
        let mainViewWidth = view.frame.width - 2 * .defaultPadding
        mainView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: UIEdgeInsets(top: .defaultPadding, left: .defaultPadding, bottom: .defaultPadding, right: .defaultPadding), size: CGSize(width: mainViewWidth, height: mainViewHeight))
        
        mainView.addSubview(typeSegmentedControl)
        mainView.addSubview(nameLabel)
        mainView.addSubview(timerLabel)
        mainView.addSubview(notesLabel)
        mainView.addSubview(nameTextField)
        mainView.addSubview(timerTextField)
        mainView.addSubview(notesTextView)
    }
    
    private func setupSegmentedControl() {
        let segmentedControlWidth = mainView.frame.width * 0.9
        typeSegmentedControl.anchor(top: mainView.topAnchor, leading: nil, bottom: nil, trailing: nil, centerX: true, padding: UIEdgeInsets(top: .defaultPadding, left: 0, bottom: 0, right: 0), size: CGSize(width: segmentedControlWidth, height: 0))
    }
    
    private func setupLabels() {
        nameLabel.anchor(top: typeSegmentedControl.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 32, left: .defaultPadding, bottom: 0, right: 0))
        timerLabel.anchor(top: nameTextField.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 32, left: .defaultPadding, bottom: 0, right: 0))
        notesLabel.anchor(top: timerTextField.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 32, left: .defaultPadding, bottom: 0, right: 0))
    }
    
    private func setupTextInputs() {
        let topPadding: CGFloat = 8
        nameTextField.anchor(top: nameLabel.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: .defaultPadding, bottom: 0, right: .defaultPadding))
        timerTextField.anchor(top: timerLabel.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: .defaultPadding, bottom: 0, right: .defaultPadding))
        
        notesTextView.anchor(top: notesLabel.bottomAnchor, leading: mainView.leadingAnchor, bottom: mainView.bottomAnchor, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: .defaultPadding, bottom: .defaultPadding, right: .defaultPadding))
    }
}
