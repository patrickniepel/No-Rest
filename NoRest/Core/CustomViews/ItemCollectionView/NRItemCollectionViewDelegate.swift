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
        
        let width = collectionView.bounds.width - 2 * padding
        let height = collectionView.bounds.height / 7
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataSource = collectionView.dataSource as? NRItemCollectionViewDataSource<T>
        if let item = dataSource?.items[safe: indexPath.item] {
            if let workout = item as? Workout {
                startEditingWorkout(workout)
            } else if let exercise = item as? Exercise {
                startEditingExercise(exercise)
            }
        }
    }
    
    func startEditingWorkout(_ workout: Workout) {
        let setupWorkoutAction = WorkoutSetupAction(workout: workout)
        store.dispatch(setupWorkoutAction)
        
        let routeAction = RouteAction(screen: .workoutSetup, in: .workouts, action: .push)
        store.dispatch(routeAction)
    }
    
    func startEditingExercise(_ exercise: Exercise) {
        let editExerciseAction = EditExerciseAction(exercise: exercise, type: nil)
        store.dispatch(editExerciseAction)
        
        let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
        store.dispatch(routeAction)
    }
}
