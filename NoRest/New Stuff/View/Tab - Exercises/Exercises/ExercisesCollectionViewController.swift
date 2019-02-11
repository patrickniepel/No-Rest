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
    
    private var delegate: ExercisesCollectionViewDelegate?
    private var dataSource: ExercisesCollectionViewDataSource?
    private var selectedCategory: Category?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select {
                $0.exercisesState
            }
        }

        collectionView?.register(ExercisesCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.exercisesCollectionViewCell)
        collectionView.setupDefaultBackgroundColor()
        
        delegate = ExercisesCollectionViewDelegate()
        dataSource = ExercisesCollectionViewDataSource(for: selectedCategory)
        
        collectionView?.delegate = delegate
        collectionView?.dataSource = dataSource
        
        setupScreen()
        setupAddButton()
    }
    
    private func setupScreen() {
        navigationItem.title = selectedCategory?.rawValue
    }
    
    private func setupAddButton() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewExercise))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    func injectCategory(_ category: Category) {
        selectedCategory = category
    }
    
    @objc private func addNewExercise() {
        
    }
    
    deinit {
        store.unsubscribe(self)
    }
}
