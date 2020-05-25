//
//  WorkoutsViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutsViewController: NRViewController {
    private lazy var tableView: NRTableView = .init()
    private let workoutsCtrl: WorkoutsController
    
    init() {
        workoutsCtrl = WorkoutsController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        viewControllerTitle = "workouts.title".localized
        super.viewDidLoad()
        
        setupAddButton()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.isHidden = false
        reloadTableViewContent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        titleLabel.isHidden = true
    }
    
    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewWorkout))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func reloadTableViewContent() {
        workoutsCtrl.updateWorkouts()
        tableView.reloadData()
        checkForEmptyWorkouts()
    }
    
    private func checkForEmptyWorkouts() {
        if workoutsCtrl.numberOfRows() == 0 {
            tableView.backgroundView = NREmptyView(text: "workout.empty".localized, addArrow: true)
            tableView.isUserInteractionEnabled = false
        } else {
            tableView.backgroundView = nil
            tableView.isUserInteractionEnabled = true
        }
    }
    
    @objc
    private func addNewWorkout() {
        openSetupScreen(with: workoutsCtrl.generateNewWorkout())
    }
    
    private func openSetupScreen(with workout: Workout) {
        let workoutSetupAction = WorkoutSetupAction(workout: workout)
        store.dispatch(workoutSetupAction)
        
        let routeAction = RouteAction(screen: .workoutSetup, in: .workouts, action: .push)
        store.dispatch(routeAction)
    }
}

extension WorkoutsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsCtrl.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.reuseIdentifier, for: indexPath) as! WorkoutTableViewCell
        
        if let workout = workoutsCtrl.workout(for: indexPath.row) {
            cell.setup(with: workout)
        }
        
        return cell
    }
}

extension WorkoutsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let workout = workoutsCtrl.workout(for: indexPath.row) else { return }
        
        openSetupScreen(with: workout)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, success: (Bool) -> Void) in
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
