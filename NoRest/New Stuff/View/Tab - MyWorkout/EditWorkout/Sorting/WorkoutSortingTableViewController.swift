//
//  WorkoutSortingTableViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit
import SCLAlertView

class WorkoutSortingTableViewController: UITableViewController {
    
    private var workout: MyWorkout? {
        didSet {
            exercisesToSort = workout?.exercises ?? []
        }
    }
    private var exercisesToSort: [Exercise] = []
    private var workoutSortingCtrl: WorkoutSortingController = WorkoutSortingController()
    
    private var dataSource: WorkoutSortingTableViewDataSource?
    private var delegate: WorkoutSortingTableViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select {
                $0.workoutSortingState
            }
        }
        
        dataSource = WorkoutSortingTableViewDataSource(workoutSortingCtrl: workoutSortingCtrl)
        delegate = WorkoutSortingTableViewDelegate()
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveWorkout))
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.title = NRConstants.ScreenTitles.sorting
    }
    
    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.setupDefaultBackgroundColor()
        tableView.rowHeight = NRConstants.TableViews.rowHeight
        tableView.tableFooterView = UIView() // Remove empty rows
        tableView.isEditing = true
        tableView.register(NRDefaultTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.nrDefaultTableViewCell)
    }
    
    func setupExerciseSorting(for workout: MyWorkout?) {
        self.workout = workout
        workoutSortingCtrl.exercisesToSort = exercisesToSort
    }
    
    @objc private func saveWorkout() {
        guard let workout = workout else {
            AlertController.showSavingFailureAlert()
            return
        }
        
        workout.exercises = workoutSortingCtrl.exercisesToSort
        let myWorkoutCtrl = MyWorkoutController()
        myWorkoutCtrl.saveWorkout(workout)
        
        AlertController.showSavingSuccessAlert()
        
        let routeAction = RouteAction(screen: .myWorkout, in: .myWorkout, action: .popAndReplace)
        store.dispatch(routeAction)
//        // reload collection view
//        let reloadAction = ReloadExercisesAction()
//        store.dispatch(reloadAction)
    }
    
    deinit {
        store.unsubscribe(self)
    }

}
