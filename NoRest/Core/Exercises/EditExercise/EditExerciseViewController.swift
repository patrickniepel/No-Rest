//
//  EditExerciseViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit
import SCLAlertView
import PNCommons

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
        view.backgroundColor = .backgroundColorUIControl
        view.applyShadow()
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let nameLabel: NRLabel = {
        let label = NRLabel(with: NRConstants.Editing.nameLabel)
        label.textColor = .textColor
        label.sizeToFit()
        return label
    }()
    
    private let timerLabel: NRLabel = {
        let label = NRLabel()
        label.textColor = .textColor
        label.sizeToFit()
        return label
    }()
    
    private let notesLabel: NRLabel = {
        let label = NRLabel(with: NRConstants.Editing.notesLabel)
        label.textColor = .textColor
        label.sizeToFit()
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .default
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Font.font, size: .fontSizeRegular)
        textField.keyboardAppearance = .default
        textField.keyboardType = .default
        textField.tintColor = .uiControl
        return textField
    }()
    
    private let timerTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Font.font, size: .fontSizeRegular)
        textField.keyboardAppearance = .default
        textField.keyboardType = .numberPad
        textField.tintColor = .uiControl
        return textField
    }()
    
    private let notesTextView: UITextView = {
        let textView = UITextView()
        textView.autocapitalizationType = .sentences
        textView.autocorrectionType = .default
        textView.font = UIFont(name: NRConstants.Font.font, size: .fontSizeRegular)
        textView.isEditable = true
        textView.keyboardAppearance = .default
        textView.keyboardType = .default
        textView.tintColor = .uiControl
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return textView
    }()
    
    var exercise: Exercise?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        notesTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupScreen()
        hideKeyboardWhenTapped()
        setupLayout()
        fillLayout()
    }
    
    private func setupScreen() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveExercise))
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .backgroundColorMain
    }
    
    private func fillLayout() {
        guard let exercise = exercise else { return }
        timerLabel.text = exercise.type == .weightLifting ? NRConstants.Editing.restTimerLabel : NRConstants.Editing.runningTimerLabel
        nameTextField.text = exercise.name
        timerTextField.text = "\(exercise.timer.valueForType)"
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
        exercise.name = SyntaxController.checkNameInputCorrect(text: nameTextField.text)
        exercise.timer.calculateSeconds(value: SyntaxController.checkTimerInputCorrect(text: timerTextField.text))
        exercise.notes = SyntaxController.checkNotesInputCorrect(text: notesTextView.text)
        let exerciseCtrl = ExerciseController()
        exerciseCtrl.saveExercise(exercise)
        AlertController.showSavingSuccessAlert()
        navigationController?.popViewController(animated: true)
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
    
    @objc private func updateNavigationTitle() {
        let textFieldText = nameTextField.text ?? ""
        if textFieldText.isBlank {
            navigationItem.title = NRConstants.ScreenTitles.newExercise
        } else {
            navigationItem.title = textFieldText
        }
    }
    
    deinit {
        unsubscribe()
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

private extension EditExerciseViewController {
    func setupLayout() {
        setupScrollView()
        setupMainView()
        setupLabels()
        setupTextInputs()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
 
    func setupMainView() {
        scrollView.addSubview(mainView)
        
        let mainViewHeight = view.frame.height - 2 * .defaultPadding
        let mainViewWidth = view.frame.width - 2 * .defaultPadding
        mainView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: UIEdgeInsets(top: .defaultPadding, left: .defaultPadding, bottom: .defaultPadding, right: .defaultPadding), size: CGSize(width: mainViewWidth, height: mainViewHeight))
        
        mainView.addSubviews(nameLabel, timerLabel, notesLabel, nameTextField, timerTextField, notesTextView)
    }
 
    func setupLabels() {
        nameLabel.anchor(top: mainView.topAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 32, left: .defaultPadding, bottom: 0, right: 0))
        timerLabel.anchor(top: nameTextField.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 32, left: .defaultPadding, bottom: 0, right: 0))
        notesLabel.anchor(top: timerTextField.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 32, left: .defaultPadding, bottom: 0, right: 0))
    }
    
    func setupTextInputs() {
        let topPadding: CGFloat = 8
        
        nameTextField.addTarget(self, action: #selector(updateNavigationTitle), for: .editingChanged)
        nameTextField.anchor(top: nameLabel.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: .defaultPadding, bottom: 0, right: .defaultPadding))
        timerTextField.anchor(top: timerLabel.bottomAnchor, leading: mainView.leadingAnchor, bottom: nil, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: .defaultPadding, bottom: 0, right: .defaultPadding))
        
        notesTextView.anchor(top: notesLabel.bottomAnchor, leading: mainView.leadingAnchor, bottom: mainView.bottomAnchor, trailing: mainView.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: .defaultPadding, bottom: .defaultPadding, right: .defaultPadding))
    }
}
