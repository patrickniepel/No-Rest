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
    
    private var workout: Workout? {
        didSet {
            exercisesToSort = workout?.exercises ?? []
        }
    }
    
    private var exercisesToSort: [Exercise] = []
    var workoutSortingCtrl: WorkoutSortingController = WorkoutSortingController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveWorkout))
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.title = NRConstants.ScreenTitles.sorting
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = NRStyle.themeColor
        tableView.rowHeight = NRConstants.TableViews.rowHeight
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.isEditing = true
        tableView.tintColor = NRStyle.primaryTextColor
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.separatorColor = NRStyle.complementaryColor
        tableView.register(NRDefaultTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.nrDefaultTableViewCell)
    }
    
    func setupExerciseSorting(for workout: Workout?) {
        self.workout = workout
        workoutSortingCtrl.exercisesToSort = exercisesToSort
    }
    
    @objc private func saveWorkout() {
        guard var workout = workout else {
            AlertController.showErrorAlert(with: "alert.message.failedSaving".localized)
            return
        }
        
        workout.exercises = workoutSortingCtrl.exercisesToSort
        
        AlertController.showSuccessAlert(with: "alert.message.succeededSaving".localized)
        
        let routeAction = RouteAction(screen: .workouts, in: .workouts, action: .popToRoot)
        store.dispatch(routeAction)
    }
    
    deinit {
        unsubscribe()
    }

}
