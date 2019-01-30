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
    }
    
    func injectCategory(_ category: Category) {
        self.selectedCategory = category
    }
    
    deinit {
        store.unsubscribe(self)
    }

}
