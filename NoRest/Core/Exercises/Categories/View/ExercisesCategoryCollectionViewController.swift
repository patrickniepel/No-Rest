//
//  ExercisesCategoryCollectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryCollectionViewController: UICollectionViewController {
    
    let padding: CGFloat = NRConstants.Padding.collectionViewItem

    override func viewDidLoad() {
        super.viewDidLoad()

        setupScreen()
        setupCollectionView()
    }
    
    private func setupScreen() {
        navigationItem.title = NRConstants.ScreenTitles.categories
    }
    
    private func setupCollectionView() {
        collectionView?.register(ExercisesCategoryCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.exercisesCategoryCollectionViewCell)
        collectionView.backgroundColor = .backgroundColorMain
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
