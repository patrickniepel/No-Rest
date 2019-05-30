//
//  NRItemCollectionViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRItemCollectionViewDelegate<T>: NSObject, UICollectionViewDelegateFlowLayout {
    
    let padding: CGFloat = NRConstants.Padding.collectionViewItem
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dataSource = collectionView.dataSource as? NRItemCollectionViewDataSource<T>
        
        if dataSource?.items.count == 0 {
            let width = collectionView.bounds.width
            let height = collectionView.bounds.height
            return CGSize(width: width, height: height)
        }
        
        let width = collectionView.bounds.width - 2 * padding
        let height = collectionView.bounds.height / 7
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let dataSource = collectionView.dataSource as? NRItemCollectionViewDataSource<T>
        
        if dataSource?.items.count == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let dataSource = collectionView.dataSource as? NRItemCollectionViewDataSource<T>
        
        if dataSource?.items.count == 0 {
            return 0
        }
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataSource = collectionView.dataSource as? NRItemCollectionViewDataSource<T>
        
        if dataSource?.items.count == 0 {
            return
        }
        
        if let item = dataSource?.items[safe: indexPath.item] {
            if let workout = item as? MyWorkout {
                startEditingWorkout(workout)
            } else if let exercise = item as? Exercise {
                startEditingExercise(exercise)
            }
        }
    }
    
    func startEditingWorkout(_ workout: MyWorkout) {
        let setupWorkoutAction = WorkoutSetupAction(workout: workout)
        store.dispatch(setupWorkoutAction)
        
        let routeAction = RouteAction(screen: .workoutSetup, in: .myWorkout, action: .push)
        store.dispatch(routeAction)
    }
    
    func startEditingExercise(_ exercise: Exercise) {
        let editExerciseAction = EditExerciseAction(exercise: exercise, category: nil)
        store.dispatch(editExerciseAction)
        
        let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
        store.dispatch(routeAction)
    }
}
