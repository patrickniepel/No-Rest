//
//  ExerciseSelectionView.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseSelectionView: NRExercisesView {
    private let exerciseSelectionCtrl: ExerciseSelectionController

    override init(frame: CGRect = CGRect()) {
        exerciseSelectionCtrl = ExerciseSelectionController()
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setup() {
        subscribe()
        super.setup()
    }

    override func setupTableView() {
        super.setupTableView()
        tableView.tintColor = NRStyle.interactionColor
        tableView.register(ExerciseSelectionTableViewCell.self, forCellReuseIdentifier: ExerciseSelectionTableViewCell.reuseIdentifier)
    }

    func updateView() {
        exercisesCtrl.updateExercises()
        exerciseSelectionCtrl.updateSelectedExercises()
        tableView.reloadData()
    }

    func selectedExercises() -> [Exercise] {
        return exerciseSelectionCtrl.selectedExercises
    }

    func preSelectExercises(_ exercises: [Exercise]?) {
        exerciseSelectionCtrl.selectedExercises = exercises ?? []
        tableView.reloadData()
    }

    deinit {
        unsubscribe()
    }
}

// MARK: - UITableViewDataSource
extension ExerciseSelectionView {
    // swiftlint:disable force_cast
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseSelectionTableViewCell.reuseIdentifier, for: indexPath) as! ExerciseSelectionTableViewCell
        if let exercise = exercisesCtrl.exercise(for: indexPath) {
            cell.setup(with: exercise, accessoryType: .checkmark)
            if exerciseSelectionCtrl.selectedExercises.contains(exercise) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ExerciseSelectionView {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedExercise = exercisesCtrl.exercise(for: indexPath) else { return }
        exerciseSelectionCtrl.toggleSelectedExercise(selectedExercise)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
