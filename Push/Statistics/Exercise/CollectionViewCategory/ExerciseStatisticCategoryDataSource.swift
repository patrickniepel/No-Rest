//
//  ExerciseStatisticCategoryDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 21.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseStatisticCategoryDataSource: NSObject, UICollectionViewDataSource {
    
    var categories : [String] = UserData.sharedInstance.categories
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! ExerciseStatisticCategoryCollectionViewCell
        
        cell.category.text = categories[indexPath.item]
        return cell
    }
}
