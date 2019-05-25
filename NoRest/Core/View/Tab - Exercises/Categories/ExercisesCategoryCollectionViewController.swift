//
//  ExercisesCategoryCollectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryCollectionViewController: UICollectionViewController {
    
    private var delegate: ExercisesCategoryCollectionViewDelegate?
    private var dataSource: ExercisesCategoryCollectionViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(ExercisesCategoryCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.exercisesCategoryCollectionViewCell)
        collectionView.backgroundColor = .backgroundColorMain
        
        delegate = ExercisesCategoryCollectionViewDelegate()
        dataSource = ExercisesCategoryCollectionViewDataSource()
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
        setupScreen()
    }
    
    private func setupScreen() {
        navigationItem.title = NRConstants.ScreenTitles.categories
    }

    
}
