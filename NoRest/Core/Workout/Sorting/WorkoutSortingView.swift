//
//  WorkoutSortingView.swift
//  NoRest
//
//  Created by Patrick Niepel on 05.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSortingView: UIView {
    private lazy var tableView: NRTableView = .init()
    
    private var workout: Workout?
    private var exercisesToSort: [Exercise] = []
    
    let workoutSortingCtrl: WorkoutSortingController
    
    override init(frame: CGRect = CGRect()) {
        workoutSortingCtrl = WorkoutSortingController()
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.fillSuperview()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.isEditing = true
        tableView.tintColor = NRStyle.complementaryColor
        tableView.register(WorkoutSetupTableViewCell.self, forCellReuseIdentifier: WorkoutSetupTableViewCell.reuseIdentifier)
    }
    
    func setupExerciseSorting(for workout: Workout?) {
        self.workout = workout
        exercisesToSort = workout?.exercises ?? []
        
        workoutSortingCtrl.exercisesToSort = exercisesToSort
    }
    
    @objc
    func saveExerciseTapped() {
        Database.update {
            workout?.exercises = workoutSortingCtrl.exercisesToSort
        }
        
        guard let workout = workout else { return }
        
        WorkoutsController.addWorkout(workout)
        
        let routeAction = RouteAction(screen: .workouts, in: .workouts, action: .popToRoot)
        store.dispatch(routeAction)
    }
}

extension WorkoutSortingView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutSortingCtrl.exercisesToSort.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutSetupTableViewCell.reuseIdentifier, for: indexPath) as! WorkoutSetupTableViewCell
        let exercise = workoutSortingCtrl.exercisesToSort[indexPath.row]
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
        workoutSortingCtrl.moveExercise(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let subView = cell.subviews.first(where: { $0.classForCoder.description() == "UITableViewCellReorderControl" })
        let reorderControlerImageView = subView?.subviews.first(where: { $0 is UIImageView }) as? UIImageView
        reorderControlerImageView?.image = reorderControlerImageView?.image?.dye(NRStyle.complementaryColor)
    }
}

extension WorkoutSortingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
