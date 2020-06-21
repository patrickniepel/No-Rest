//
//  WorkoutsView.swift
//  NoRest
//
//  Created by Patrick Niepel on 05.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutsView: UIView {
    private lazy var tableView: NRTableView = .init()
    private let workoutsCtrl: WorkoutsController

    override init(frame: CGRect = CGRect()) {
        workoutsCtrl = WorkoutsController()
        super.init(frame: frame)
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        addSubview(tableView)
        tableView.fillSuperview()

        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func checkForEmptyWorkouts() {
        if workoutsCtrl.numberOfRows() == 0 {
            tableView.backgroundView = NREmptyView(text: "workout.empty".localized, arrowDirection: .topRight)
            tableView.isUserInteractionEnabled = false
        } else {
            tableView.backgroundView = nil
            tableView.isUserInteractionEnabled = true
        }
    }

    private func openSetupScreen(with workout: Workout) {
        let workoutAction = WorkoutAction(workout: workout)
        store.dispatch(workoutAction)

        let routeAction = RouteAction(screen: .workout, in: .workouts, action: .push)
        store.dispatch(routeAction)
    }

    func reloadTableViewContent() {
        workoutsCtrl.updateWorkouts()
        tableView.reloadData()
        checkForEmptyWorkouts()
    }

    @objc
    func addNewWorkout() {
        openSetupScreen(with: workoutsCtrl.generateNewWorkout())
    }
}

extension WorkoutsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsCtrl.numberOfRows()
    }

    // swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.reuseIdentifier, for: indexPath) as! WorkoutTableViewCell

        if let workout = workoutsCtrl.workout(for: indexPath.row) {
            cell.setup(with: workout)
        }
        return cell
    }
}

extension WorkoutsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let workout = workoutsCtrl.workout(for: indexPath.row) else { return }

        openSetupScreen(with: workout)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (_, _, success: (Bool) -> Void) in
            self?.workoutsCtrl.deleteWorkout(in: indexPath.row)
            self?.workoutsCtrl.updateWorkouts()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self?.checkForEmptyWorkouts()
            success(true)
        }

        deleteAction.image = NRStyle.binIcon?.dye(.white)
        deleteAction.backgroundColor = NRStyle.warningColor

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
