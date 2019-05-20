//
//  MyWorkoutCollectionViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    let padding: CGFloat = NRConstants.Padding.collectionViewItem
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dataSource = collectionView.dataSource as? MyWorkoutCollectionViewDataSource
        
        if dataSource?.myWorkoutController.workoutCount() == 0 {
            let width = collectionView.bounds.width
            let height = collectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        
        let width = collectionView.bounds.width - 2 * padding
        let height = collectionView.bounds.height / 7
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let dataSource = collectionView.dataSource as? MyWorkoutCollectionViewDataSource
        
        if dataSource?.myWorkoutController.workoutCount() == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let dataSource = collectionView.dataSource as? MyWorkoutCollectionViewDataSource
        
        if dataSource?.myWorkoutController.workoutCount() == 0 {
            return 0
        }
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataSource = collectionView.dataSource as? MyWorkoutCollectionViewDataSource
        
        if dataSource?.myWorkoutController.workoutCount() == 0 {
            return
        }
        
        if let workout = dataSource?.myWorkoutController.allWorkouts()[indexPath.item] {
            //Start Workout
        }
    }
}
