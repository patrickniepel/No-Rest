//
//  ExercisesCollectionViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    let padding: CGFloat = NRConstants.Padding.collectionViewItem
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width - 2 * padding
        let height = collectionView.frame.height / 7
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataSource = collectionView.dataSource as? ExercisesCollectionViewDataSource
        let currentCategory = dataSource?.category
        
        if let exercise = currentCategory?.exercises[indexPath.item] {
            let editExerciseAction = EditExerciseAction(exercise: exercise, category: nil)
            store.dispatch(editExerciseAction)
            
            let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
            store.dispatch(routeAction)
        }
    }
}
