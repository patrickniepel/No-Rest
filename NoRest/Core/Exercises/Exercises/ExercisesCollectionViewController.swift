//
//  ExercisesCollectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit
import ReSwift

class ExercisesCollectionViewController: UICollectionViewController {
    
    private var delegate: NRItemCollectionViewDelegate<Exercise>?
    private var dataSource: NRItemCollectionViewDataSource<Exercise>?
    private var selectedCategory: Category?
    private let exerciseCtrl = ExerciseController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        setupCollectionView()
        setupScreen()
        setupAddButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataSource?.items = exerciseCtrl.exercises(for: selectedCategory)
        collectionView.reloadData()
        checkForEmptyExercises()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !PersistencyController.didShowOnboarding(type: .exercises) {
            AlertController.showOnboardingAlert(with: NRConstants.Alerts.exercisesInfo, onboardingType: .exercises)
        }
    }
    
    private func setupCollectionView() {
        collectionView?.register(NRItemCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.itemCollectionViewCell)
        collectionView?.register(NREmptyCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.emptyCollectionViewCell)
        collectionView.backgroundColor = .backgroundColorMain
        
        delegate = NRItemCollectionViewDelegate()
        dataSource = NRItemCollectionViewDataSource(items: exerciseCtrl.exercises(for: selectedCategory))
        
        collectionView?.delegate = delegate
        collectionView?.dataSource = dataSource
    }
    
    private func setupScreen() {
        navigationItem.title = selectedCategory?.rawValue
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupAddButton() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewExercise))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    func injectCategory(_ category: Category) {
        selectedCategory = category
    }
    
    @objc private func addNewExercise() {
        let editExerciseAction = EditExerciseAction(exercise: nil, category: selectedCategory)
        store.dispatch(editExerciseAction)
        
        let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
        store.dispatch(routeAction)
    }
    
    func deleteExercise(at indexPath: IndexPath) {
        if let exercise = dataSource?.items[safe: indexPath.item] {
            exerciseCtrl.deleteExercise(exercise)
            dataSource?.deleteItem(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
            checkForEmptyExercises()
        }
    }
    
    private func checkForEmptyExercises() {
        if exerciseCtrl.exercisesCount(for: selectedCategory) == 0 {
            collectionView.backgroundView = NREmptyView(text: NRConstants.Texts.emptyExercises, addArrow: true)
            collectionView.isUserInteractionEnabled = false
        } else {
            collectionView.backgroundView = nil
            collectionView.isUserInteractionEnabled = true
        }
    }
    
    deinit {
        unsubscribe()
    }
}
