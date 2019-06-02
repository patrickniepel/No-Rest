//
//  WorkoutSetupViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSetupViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = NRConstants.TableViews.rowHeight
        tableView.sectionHeaderHeight = NRConstants.TableViews.sectionHeight
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = true
        tableView.separatorColor = .uiControl
        tableView.tintColor = .uiControl
        tableView.backgroundColor = .backgroundColorMain
        tableView.register(NRDefaultTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.nrDefaultTableViewCell)
        return tableView
    }()
    
    private let nameLabel: NRLabel = {
        let label = NRLabel(with: NRConstants.Editing.nameLabel)
        label.textColor = .textColor
        label.sizeToFit()
        label.makeBold()
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textField.adjustsFontSizeToFitWidth = true
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .default
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Font.font, size: .fontSizeRegular)
        textField.keyboardAppearance = .default
        textField.keyboardType = .default
        return textField
    }()
    
    var workoutSetupCtrl = WorkoutSetupController()
    var workout: MyWorkout?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()

        setupTableView()
        setupScreen()
        hideKeyboardWhenTapped()
        setupLayout()
        fillLayout()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupScreen() {
        let sortingButton = UIBarButtonItem(title: NRConstants.ButtonTitles.sortingButton, style: .plain, target: self, action: #selector(openSortingScreen))
        navigationItem.rightBarButtonItem = sortingButton
        view.backgroundColor = .backgroundColorUIControl
    }
    
    private func fillLayout() {
        guard let workout = workout else { return }
        nameTextField.text = workout.name
        workoutSetupCtrl.selectedExercises = workout.exercises
        tableView.reloadData()
    }
    
    func setupWorkout(_ workout: MyWorkout?) {
        if let workout = workout {
            self.workout = workout
        } else {
            self.workout = MyWorkout(name: "", exercises: [])
        }
        navigationItem.title = workout?.name ?? NRConstants.ScreenTitles.newWorkout
    }
    
    @objc private func openSortingScreen() {
        guard var workout = workout else { return }
        workout.exercises = workoutSetupCtrl.selectedExercises
        workout.name = SyntaxController.checkNameInputCorrect(text: nameTextField.text)
        
        let sortingAction = WorkoutSortingAction(workout: workout)
        store.dispatch(sortingAction)
        
        let routeAction = RouteAction(screen: .workoutSorting, in: .myWorkout)
        store.dispatch(routeAction)
    }
    
    @objc private func updateNavigationTitle() {
        let textFieldText = nameTextField.text ?? ""
        if textFieldText.isBlank {
            navigationItem.title = NRConstants.ScreenTitles.newWorkout
        } else {
            navigationItem.title = textFieldText
        }
    }
    
    deinit {
        unsubscribe()
    }
}

// Layout
extension WorkoutSetupViewController {
    
    private func setupLayout() {
        view.addSubviews(nameLabel, nameTextField, tableView)
        setupNameLayout()
        setupTableViewLayout()
    }
    
    private func setupNameLayout() {
        nameLabel.anchor(top: view.layoutGuide().topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: .defaultPadding, left: .defaultPadding, bottom: 0, right: 0))
        
        nameTextField.addTarget(self, action: #selector(updateNavigationTitle), for: .editingChanged)
        nameTextField.anchor(top: nameLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 8, left: .defaultPadding, bottom: 0, right: .defaultPadding))
    }
    
    private func setupTableViewLayout() {
        let bottomAnchor: NSLayoutYAxisAnchor?
        if #available(iOS 11.0, *) {
            bottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
        } else {
            bottomAnchor = view.bottomAnchor
        }
        tableView.anchor(top: nameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: .defaultPadding, left: 0, bottom: 0, right: 0))
    }
}

