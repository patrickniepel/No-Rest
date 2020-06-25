//
//  WorkoutViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class WorkoutViewController: NRViewController {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "workout.name".localized
        return label
    }()

    private lazy var nameTextField: NRTextField = {
        let textField = NRTextField()
        textField.placeholder = "workout.name.placeholder".localized
        textField.addTarget(self, action: #selector(handleNameChange), for: .editingChanged)
        return textField
    }()

    private lazy var selectExercisesButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleSelectExercises), for: .touchUpInside)
        button.setTitle("workout.exercise.selection".localized, for: .normal)
        button.layer.cornerRadius = 10
        button.applyShadow()
        return button
    }()

    private lazy var tableView: NRTableView = .init()

    private let workoutCtrl: WorkoutController
    private var workout: Workout?

    init() {
        workoutCtrl = WorkoutController()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        subscribe()

        setupSaveButton()
        setupView()
        setupTableView()

        hideKeyboardWhenTapped()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadExercises()
    }

    private func setupSaveButton() {
        let continueButton = UIBarButtonItem(title: "button.title.save".localized, style: .plain, target: self, action: #selector(handleSaveTapped))
        navigationItem.rightBarButtonItem = continueButton
    }

    private func setupView() {
        [nameLabel, nameTextField, tableView, selectExercisesButton].forEach(view.addSubview)

        nameLabel.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         padding: .init(top: NRStyle.verticalPadding, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))

        nameTextField.anchor(top: nameLabel.bottomAnchor,
                             leading: nameLabel.leadingAnchor,
                             trailing: nameLabel.trailingAnchor,
                             padding: .init(top: NRStyle.verticalPadding / 2, left: 0, bottom: 0, right: 0))

        tableView.anchor(top: nameTextField.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         padding: .init(top: NRStyle.verticalPadding, left: 0, bottom: 0, right: 0))

        selectExercisesButton.anchor(top: tableView.bottomAnchor,
                                     leading: view.leadingAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     trailing: view.trailingAnchor,
                                     padding: .init(top: NRStyle.verticalPadding,
                                                    left: NRStyle.horizontalPadding * 2,
                                                    bottom: NRStyle.verticalPadding,
                                                    right: NRStyle.horizontalPadding * 2),
                                     size: .init(width: 0, height: 50))
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.isEditing = true
        tableView.register(ExerciseSelectionTableViewCell.self, forCellReuseIdentifier: ExerciseSelectionTableViewCell.reuseIdentifier)
    }

    private func checkForEmptyExercises() {
        if workoutCtrl.exercises.isEmpty {
            tableView.backgroundView = NREmptyView(text: "workout.sorting.empty".localized, arrowDirection: .bottomRight)
            tableView.isUserInteractionEnabled = false
        } else {
            tableView.backgroundView = nil
            tableView.isUserInteractionEnabled = true
        }
    }

    private func reloadExercises() {
        checkForEmptyExercises()
        tableView.reloadData()
    }

    @objc
    private func handleNameChange() {
        navigationItem.title = nameTextField.text
    }

    @objc
    private func handleSaveTapped() {
        guard let name = nameTextField.text, !name.isBlank
        else {
            AlertController.showDefaultAlert(title: "alert.message.invalidInput".localized, message: "alert.message.workout.input".localized, in: .workouts)
            return
        }

        workout?.name = name
        workout?.exercises = workoutCtrl.exercises

        guard let workout = workout else { return }

        WorkoutsController.addWorkout(workout)

        navigationController?.popViewController(animated: true)
    }

    @objc
    func handleSelectExercises() {
        let exerciseSelectionAction = ExerciseSelectionAction(selectedExercises: workoutCtrl.exercises)
        store.dispatch(exerciseSelectionAction)

        let routeAction = RouteAction(screen: .exerciseSelection, in: .workouts)
        store.dispatch(routeAction)
    }

    func setupWorkout(_ workout: Workout) {
        self.workout = workout
        nameTextField.text = workout.name
        navigationItem.title = workout.name
        workoutCtrl.exercises = workout.exercises
    }

    func addExercises(_ exercises: [Exercise]) {
        workoutCtrl.exercises = exercises
        reloadExercises()
    }

    override func apply(theme: ViewControllerTheme) {
        super.apply(theme: theme)

        guard let workoutTheme = (ThemeManager.default.theme as? ApplicationTheme)?.custom.workoutTheme else { return }

        tableView.tintColor = workoutTheme.accentuationColor

        nameLabel.textColor = workoutTheme.textColor
        nameLabel.font = workoutTheme.textFontVerySmall

        selectExercisesButton.backgroundColor = workoutTheme.interactionColor
        selectExercisesButton.setTitleColor(workoutTheme.textColor, for: .normal)
        selectExercisesButton.titleLabel?.font = workoutTheme.textFontMedium
    }

    deinit {
        unsubscribe()
    }
}

extension WorkoutViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutCtrl.exercises.count
    }

    // swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseSelectionTableViewCell.reuseIdentifier, for: indexPath) as! ExerciseSelectionTableViewCell
        let exercise = workoutCtrl.exercises[indexPath.row]
        cell.setup(with: exercise, accessoryType: .none)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        workoutCtrl.moveExercise(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let subView = cell.subviews.first(where: { $0.classForCoder.description() == "UITableViewCellReorderControl" })
        let reorderControlerImageView = subView?.subviews.first(where: { $0 is UIImageView }) as? UIImageView

        guard let workoutTheme = (ThemeManager.default.theme as? ApplicationTheme)?.custom.workoutTheme else { return }

        reorderControlerImageView?.image = reorderControlerImageView?.image?.dye(workoutTheme.interactionColor)
    }
}

extension WorkoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
