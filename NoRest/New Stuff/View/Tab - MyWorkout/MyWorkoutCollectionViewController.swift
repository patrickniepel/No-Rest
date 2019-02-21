//
//  MyWorkoutCollectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutCollectionViewController: UICollectionViewController {
    
    private var dataSource: MyWorkoutCollectionViewDataSource?
    private var delegate: MyWorkoutCollectionViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select {
                $0.myWorkoutState
            }
        }

        dataSource = MyWorkoutCollectionViewDataSource()
        delegate = MyWorkoutCollectionViewDelegate()
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.register(MyWorkoutCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.myWorkoutCollectionViewCell)
        
        collectionView.setupDefaultBackgroundColor()
        setupNavBar()
    }
    
    private func setupNavBar() {
        let historyButton = UIBarButtonItem(title: NRConstants.ScreenTitles.history, style: .plain, target: self, action: #selector(openHistory))
        navigationItem.leftBarButtonItem = historyButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkout))
        navigationItem.rightBarButtonItem = addButton
        
        navigationItem.title = NRConstants.ScreenTitles.myWorkout
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    @objc private func openHistory() {
        let routeAction = RouteAction(screen: .history, in: .myWorkout)
        store.dispatch(routeAction)
    }
    
    @objc private func addWorkout() {
        let addWorkoutAction = WorkoutSettingAction(workout: nil)
        store.dispatch(addWorkoutAction)
        
        let routeAction = RouteAction(screen: .workoutSetting, in: .myWorkout)
        store.dispatch(routeAction)
    }
    
    deinit {
        store.unsubscribe(self)
    }
}
