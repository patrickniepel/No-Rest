//
//  WorkoutsCollectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutsCollectionViewController: UICollectionViewController {
    
    private var dataSource: NRItemCollectionViewDataSource<Workout>?
    private var delegate: NRItemCollectionViewDelegate<Workout>?
    
    private let workoutsCtrl = WorkoutsController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        dataSource?.items = workoutsCtrl.allWorkouts()
        collectionView.reloadData()
        checkForEmptyWorkouts()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if workoutsCtrl.allWorkouts().count != 0 && !UserDefaultsController.didShowOnboarding(type: .startWorkout) {
            AlertController.showOnboardingAlert(with: NRConstants.Alerts.startWorkoutInfo, onboardingType: .startWorkout)
        }
    }
    
    private func setupCollectionView() {
        dataSource = NRItemCollectionViewDataSource(items: workoutsCtrl.allWorkouts())
        delegate = NRItemCollectionViewDelegate()
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.register(NRItemCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.itemCollectionViewCell)
        collectionView.register(NREmptyCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.emptyCollectionViewCell)
        collectionView.backgroundColor = NRStyle.themeColor
    }
    
    private func setupNavBar() {
        let historyButton = UIBarButtonItem(title: NRConstants.ScreenTitles.history, style: .plain, target: self, action: #selector(openHistory))
        navigationItem.leftBarButtonItem = historyButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkout))
        navigationItem.rightBarButtonItem = addButton
        
        navigationItem.title = NRConstants.ScreenTitles.myWorkout
    }

    @objc private func openHistory() {
        let routeAction = RouteAction(screen: .history, in: .workouts)
        store.dispatch(routeAction)
    }
    
    @objc private func addWorkout() {
        let setupWorkoutAction = WorkoutSetupAction(workout: nil)
        store.dispatch(setupWorkoutAction)
        
        let routeAction = RouteAction(screen: .workoutSetup, in: .workouts)
        store.dispatch(routeAction)
    }
    
    func deleteWorkout(at indexPath: IndexPath) {
        if let workout = dataSource?.items[safe: indexPath.item] {
            Workout.delete(with: workout.id)
            dataSource?.deleteItem(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
            checkForEmptyWorkouts()
        }
    }
    
    private func checkForEmptyWorkouts() {
        if workoutsCtrl.allWorkouts().count == 0 {
            collectionView.backgroundView = NREmptyView(text: NRConstants.Texts.emptyWorkouts, addArrow: true)
            collectionView.isUserInteractionEnabled = false
        } else {
            collectionView.backgroundView = nil
            collectionView.isUserInteractionEnabled = true
        }
    }
}
