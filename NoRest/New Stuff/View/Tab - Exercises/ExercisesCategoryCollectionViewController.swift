//
//  ExercisesCategoryCollectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryCollectionViewController: UICollectionViewController {
    
    private var delegate: ExercisesCategoryDelegate?
    private var dataSource: ExercisesCategoryDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()


        collectionView?.register(ExercisesCategoryCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.exercisesCategoryCollectionViewCell)
        collectionView?.backgroundColor = .mainColorLight
        
        delegate = ExercisesCategoryDelegate()
        dataSource = ExercisesCategoryDataSource()
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }

    
}
