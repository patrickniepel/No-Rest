//
//  WorkoutSortingViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSortingViewController: NRViewController {
    private lazy var tableView: NRTableView = .init()
    
    private var workout: Workout?
    private var exercisesToSort: [Exercise] = []
    
    let workoutSortingCtrl: WorkoutSortingController
    
    init() {
        workoutSortingCtrl = WorkoutSortingController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        
        setupSaveButton()
        setupTableView()
    }
    
    private func setupSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveExerciseTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
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
        
        navigationItem.title = workout?.name
        
        workoutSortingCtrl.exercisesToSort = exercisesToSort
    }
    
    @objc private func saveExerciseTapped() {
        Database.update {
            workout?.exercises = workoutSortingCtrl.exercisesToSort
        }
        
        guard let workout = workout else { return }
        
        WorkoutsController.addWorkout(workout)
        
        let routeAction = RouteAction(screen: .workouts, in: .workouts, action: .popToRoot)
        store.dispatch(routeAction)
    }
    
    deinit {
        unsubscribe()
    }

}

extension WorkoutSortingViewController: UITableViewDataSource {
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

extension WorkoutSortingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
