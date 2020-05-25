//
//  WorkoutSetupViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSetupViewController: NRViewController {
    private lazy var nameLabel: NRLabel = .init(with: "workout.name".localized)
    private lazy var nameTextField: NRTextField = {
        let textField = NRTextField()
        textField.placeholder = "workout.name.placeholder".localized
        textField.addTarget(self, action: #selector(handleNameChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var tableView: NRTableView = .init()
    
    private let exercisesCtrl: ExercisesController
    private let workoutSetupCtrl: WorkoutSetupController
    private var workout: Workout?
    
    init() {
        exercisesCtrl = ExercisesController()
        workoutSetupCtrl = WorkoutSetupController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        
        setupContinueButton()
        setupView()
        setupTableView()
        preSelectExercises()
        
        hideKeyboardWhenTapped()
    }
    
    private func setupContinueButton() {
        let continueButton = UIBarButtonItem(title: "button.title.continue".localized, style: .plain, target: self, action: #selector(handleContinueTapped))
        navigationItem.rightBarButtonItem = continueButton
    }
    
    private func setupView() {
        [nameLabel, nameTextField, tableView].forEach(view.addSubview)
        
        nameLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))
        nameTextField.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, trailing: nameLabel.trailingAnchor, padding: .init(top: NRStyle.verticalPadding / 2, left: 0, bottom: 0, right: 0))
        tableView.anchor(top: nameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: 0, bottom: 0, right: 0))
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tintColor = NRStyle.complementaryColor
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.register(WorkoutSetupTableViewCell.self, forCellReuseIdentifier: WorkoutSetupTableViewCell.reuseIdentifier)
    }
    
    private func preSelectExercises() {
        nameTextField.text = workout?.name
        workoutSetupCtrl.selectedExercises = workout?.exercises ?? []
        tableView.reloadData()
    }
    
    func setupWorkout(_ workout: Workout?) {
        self.workout = workout
        guard let workout = self.workout else { return }
        
        nameTextField.text = workout.name
        navigationItem.title = workout.name
    }
    
    @objc
    private func handleNameChange() {
        navigationItem.title = nameTextField.text
    }
    
    @objc
    private func handleContinueTapped() {
        let selectedExercises = workoutSetupCtrl.selectedExercises.sorted()
        guard let name = nameTextField.text, !name.isBlank,
            selectedExercises.count != 0
        else {
            AlertController.showDefaultAlert(title: "alert.message.invalidInput".localized, message: "alert.message.workout.input".localized, in: .workouts)
            return
        }
        
        Database.update {
            workout?.name = name
            workout?.exercises = selectedExercises
        }
        
        guard let workout = workout else { return }
        
        let sortingAction = WorkoutSortingAction(workout: workout)
        store.dispatch(sortingAction)
        
        let routeAction = RouteAction(screen: .workoutSorting, in: .workouts)
        store.dispatch(routeAction)
    }
    
    deinit {
        unsubscribe()
    }
}

extension WorkoutSetupViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return exercisesCtrl.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesCtrl.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutSetupTableViewCell.reuseIdentifier, for: indexPath) as! WorkoutSetupTableViewCell
        
        if let exercise = exercisesCtrl.exercise(for: indexPath) {
            cell.setup(with: exercise, accessoryType: .checkmark)
            if workoutSetupCtrl.selectedExercises.contains(exercise) {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = ExerciseType.allCases[section].rawValue
        let headerView = NRTableViewSectionHeaderView(title: sectionTitle)
        return headerView
    }
}

extension WorkoutSetupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedExercise = exercisesCtrl.exercise(for: indexPath) else { return }
        workoutSetupCtrl.toggleSelectedExercise(selectedExercise)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
