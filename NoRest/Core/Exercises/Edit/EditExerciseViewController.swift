//
//  EditExerciseViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit
import PNCommons

class EditExerciseViewController: NRViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = NRStyle.themeColor
        return view
    }()
    
    private lazy var exerciseImageView: NRExerciseImageView = .init()
    private lazy var selectionImageView: NRImageView = {
        let imageView = NRImageView()
        imageView.image = NRStyle.selectionIcon
        return imageView
    }()
    
    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = NRStyle.complementaryColor
        return view
    }()
    
    private lazy var nameLabel: NRLabel = NRLabel(with: "exercise.name".localized, size: NRStyle.fontSizeVerySmall)
    private lazy var nameTextfield: NRTextField = {
       let textField = NRTextField()
        textField.addTarget(self, action: #selector(handleNameChange), for: .editingChanged)
        textField.placeholder = "exercise.name.placeholder".localized
        return textField
    }()
    
    private lazy var typeLabel: NRLabel = NRLabel(with: "exercise.type".localized, size: NRStyle.fontSizeVerySmall)
    private lazy var typeTextfield: NRTextField = {
        let textField = NRTextField()
        textField.addTarget(self, action: #selector(handleTypeChange), for: .editingDidBegin)
        return textField
    }()
    private lazy var typePicker: NRPickerView = .init()
    
    private lazy var timerLabel: NRLabel = NRLabel(with: "", size: NRStyle.fontSizeVerySmall)
    private lazy var timerTextfield: NRTextField = {
        let textField = NRTextField()
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var notesLabel: NRLabel = NRLabel(with: "exercise.notes".localized, size: NRStyle.fontSizeVerySmall)
    private lazy var notesTextView: NRTextView = .init()
    
    private var exercise: Exercise?
    private var tapGestureRecognizer: UITapGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        
        setupSaveButton()
        setupLayout()
        setupImageSelection()
        setupTypeSelection()
        
        hideKeyboardWhenTapped()
    }
    
    private func setupSaveButton() {
        let saveButton = UIBarButtonItem(title: "button.title.save".localized, style: .plain, target: self, action: #selector(saveExerciseTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    func setupExercise(_ exercise: Exercise) {
        self.exercise = exercise
    
        navigationItem.title = exercise.name
        exerciseImageView.image = exercise.icon
        nameTextfield.text = exercise.name
        typeTextfield.text = exercise.type?.displayName
        timerLabel.text = exercise.type == .cardio ? "exercise.timer.minutes".localized : "exercise.timer.seconds".localized
        timerTextfield.text = exercise.type == .cardio ? "\(exercise.timer / 60)" : "\(exercise.timer)"
        notesTextView.text = exercise.notes
    }
    
    func selectIcon(_ icon: UIImage) {
        exerciseImageView.image = icon
    }
    
    @objc
    private func handleImageSelection() {
        let currentSelectionIconAction = CurrentIconSelectionAction(icon: exercise?.icon)
        store.dispatch(currentSelectionIconAction)
        
        let routeAction = RouteAction(screen: .iconSelection, in: .exercises, action: .modally)
        store.dispatch(routeAction)
    }
    
    @objc
    private func handleNameChange() {
        navigationItem.title = nameTextfield.text
    }
    
    @objc
    private func handleTypeChange() {
        let row = ExerciseType.allCases.firstIndex(where: { $0.displayName == typeTextfield.text }) ?? 0
        typePicker.selectRow(row, inComponent: 0, animated: false)
    }
    
    @objc
    private func saveExerciseTapped() {
        guard let name = nameTextfield.text, !name.isBlank, let typeText = typeTextfield.text
        else {
            AlertController.showDefaultAlert(title: "alert.message.invalidInput".localized, message: "alert.message.exercise.input".localized, in: .exercises)
            return
        }
        
        let type = ExerciseType.type(for: typeText)
        let timerText = timerTextfield.text ?? "0"
        let timer = Int(timerText) ?? 0
        
        exercise?.icon = exerciseImageView.image
        exercise?.name = name
        exercise?.type = type
        exercise?.timer = type == .cardio ? timer * 60 : timer
        exercise?.notes = notesTextView.text
            
        guard let exercise = exercise else { return }
        
        ExercisesController.addExercise(exercise)
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        unsubscribe()
        
        guard let tapGestureRecognizer = tapGestureRecognizer else { return }
        exerciseImageView.removeGestureRecognizer(tapGestureRecognizer)
    }
}

private extension EditExerciseViewController {
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, size: .init(width: view.bounds.width, height: view.bounds.height))
        
        [exerciseImageView, selectionImageView, separator, nameLabel, nameTextfield, typeLabel, typeTextfield, timerLabel, timerTextfield, notesLabel, notesTextView].forEach(contentView.addSubview)
        
        let horizontalPadding = NRStyle.horizontalPadding
        let verticalPadding = NRStyle.verticalPadding
        
        exerciseImageView.anchor(top: contentView.topAnchor, centerX: contentView.centerXAnchor, padding: .init(top: verticalPadding, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        
        selectionImageView.anchor(bottom: exerciseImageView.bottomAnchor, trailing: exerciseImageView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 2, right: 2), size: .init(width: 20, height: 20))
        
        separator.anchor(top: exerciseImageView.bottomAnchor, centerX: contentView.centerXAnchor, padding: .init(top: verticalPadding * 2, left: 0, bottom: 0, right: 0), size: .init(width: UIScreen.main.bounds.width * 0.75, height: 1))
        
        nameLabel.anchor(top: separator.bottomAnchor, leading: contentView.leadingAnchor, padding: .init(top: verticalPadding * 2, left: NRStyle.horizontalPadding, bottom: 0, right: 0))
        nameTextfield.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: verticalPadding / 2, left: 0, bottom: 0, right: horizontalPadding))
        
        typeLabel.anchor(top: nameTextfield.bottomAnchor, leading: nameTextfield.leadingAnchor, trailing: contentView.centerXAnchor, padding: .init(top: verticalPadding * 2, left: 0, bottom: 0, right: horizontalPadding / 2))
        typeTextfield.anchor(top: typeLabel.bottomAnchor, leading: typeLabel.leadingAnchor, trailing: contentView.centerXAnchor, padding: .init(top: verticalPadding / 2, left: 0, bottom: 0, right: horizontalPadding / 2))
        
        timerLabel.anchor(top: typeLabel.topAnchor, leading: contentView.centerXAnchor, padding: .init(top: 0, left: horizontalPadding / 2, bottom: 0, right: horizontalPadding))
        timerTextfield.anchor(top: timerLabel.bottomAnchor, leading: contentView.centerXAnchor, trailing: contentView.trailingAnchor, padding: .init(top: verticalPadding / 2, left: horizontalPadding / 2, bottom: 0, right: horizontalPadding))
        
        notesLabel.anchor(top: typeTextfield.bottomAnchor, leading: typeTextfield.leadingAnchor, padding: .init(top: verticalPadding * 2, left: 0, bottom: 0, right: 0))
        notesTextView.anchor(top: notesLabel.bottomAnchor, leading: notesLabel.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: verticalPadding / 2, left: 0, bottom: 0, right: horizontalPadding), size: .init(width: 0, height: 250))
        
        exerciseImageView.addDefaultShadow()
    }
    
    func setupTypeSelection() {
        typeTextfield.inputView = typePicker
        typePicker.delegate = self
    }
    
    func setupImageSelection() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleImageSelection))
        exerciseImageView.addGestureRecognizer(tapGestureRecognizer!)
    }
}

extension EditExerciseViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ExerciseType.allCases.count
    }
}

extension EditExerciseViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ExerciseType.allCases[row].displayName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedType = ExerciseType.allCases[row]
        typeTextfield.text = selectedType.displayName
        timerLabel.text = selectedType == .cardio ? "exercise.timer.minutes".localized : "exercise.timer.seconds".localized
    }
}
