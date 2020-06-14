//
//  ExercisesView.swift
//  NoRest
//
//  Created by Patrick Niepel on 05.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesView: NRExercisesView {
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupTableView() {
        super.setupTableView()
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.reuseIdentifier)
    }
    
    private func openEditScreen(with exercise: Exercise) {
        let editExerciseAction = EditExerciseAction(exercise: exercise)
        store.dispatch(editExerciseAction)
        
        let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
        store.dispatch(routeAction)
    }
    
    @objc
    func addNewExercise() {
        openEditScreen(with: exercisesCtrl.generateNewExercise())
    }
    
    func reloadTableViewContent() {
        exercisesCtrl.updateExercises()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ExercisesView {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.reuseIdentifier, for: indexPath) as! ExerciseTableViewCell
        
        if let exercise = exercisesCtrl.exercise(for: indexPath) {
            cell.setup(with: exercise)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ExercisesView {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let exercise = exercisesCtrl.exercise(for: indexPath) else { return }
        
        openEditScreen(with: exercise)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, success: (Bool) -> Void) in
            self?.exercisesCtrl.deleteExercise(for: indexPath)
            self?.exercisesCtrl.updateExercises()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            success(true)
        }

        deleteAction.image = NRStyle.binIcon?.dye(.white)
        deleteAction.backgroundColor = NRStyle.warningColor

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
