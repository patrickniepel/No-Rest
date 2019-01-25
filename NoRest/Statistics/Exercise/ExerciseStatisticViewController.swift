//
//  ExerciseStatisticViewController.swift
//  Push
//
//  Created by Patrick Niepel on 21.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseStatisticViewController: UIViewController {
    
    var statisticCtrl : StatisticsController?
    
    @IBOutlet weak var totalSets: UILabel!
    @IBOutlet weak var maxWeight: UILabel!
    @IBOutlet weak var totalVolume: UILabel!
    @IBOutlet weak var avgVolume: UILabel!
    @IBOutlet weak var totalReps: UILabel!
    @IBOutlet weak var avgReps: UILabel!
    
    @IBOutlet var headerLabels: [UILabel]!
    
    @IBOutlet weak var totalMinutesHeader: UILabel!
    @IBOutlet weak var totalMinutes: UILabel!
    
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    @IBOutlet weak var collectionViewExercise: UICollectionView!
    
    var dataSourceCategory : ExerciseStatisticCategoryDataSource?
    var delegateCategory : ExerciseStatisticCategoryDelegateFlowLayout?
    
    var dataSourceExercise : ExerciseStatisticExerciseDataSource?
    var delegateExercise : ExerciseStatisticExerciseDelegateFlowLayout?
    
    var currentCategory = 0
    var currentExercise = 0
    
    var totalCategories = 0
    var totalExercises = 0
    
    var dataLabels : [UILabel] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLabels = [totalSets, maxWeight, totalVolume, avgVolume, totalReps, avgReps]
        
        dataSourceCategory = ExerciseStatisticCategoryDataSource()
        delegateCategory = ExerciseStatisticCategoryDelegateFlowLayout()
        collectionViewCategory.dataSource = dataSourceCategory
        collectionViewCategory.delegate = delegateCategory
        
        dataSourceExercise = ExerciseStatisticExerciseDataSource()
        delegateExercise = ExerciseStatisticExerciseDelegateFlowLayout()
        
        collectionViewExercise.dataSource = dataSourceExercise
        collectionViewExercise.delegate = delegateExercise
        
        totalCategories = dataSourceCategory?.categories.count ?? 0
        
        updateExercises()
        updateLabels()
        
        totalMinutes.isHidden = true
        totalMinutesHeader.isHidden = true
    }
    
    private func updateLabels() {
        
        let unit = UserData.sharedInstance.unit
        
        let exerciseName = dataSourceExercise?.exercises[currentExercise].name ?? "My Exercise"
        
        let totalSetsString =  statisticCtrl?.getTotalSets(for: exerciseName) ?? "0"
        totalSets.text = totalSetsString
        
        maxWeight.text = statisticCtrl?.getMaxWeight(for: exerciseName) ?? "0" + unit
        
        let totalVolumeString = statisticCtrl?.getTotalVolume(for: exerciseName) ?? "0"
        totalVolume.text = totalVolumeString + unit
        
        avgVolume.text = statisticCtrl?.getAvgVolume(totalSets: totalSetsString, totalVolume: totalVolumeString) ?? "0" + unit
        
        let totalRepsString = statisticCtrl?.getTotalReps(for: exerciseName) ?? "0"
        totalReps.text = totalRepsString
        
        avgReps.text = statisticCtrl?.getAvgReps(totalSets: totalSetsString, totalReps: totalRepsString)
        
        let totalMinutesString = statisticCtrl?.getTotalMinutes(for: exerciseName)
        totalMinutes.text = totalMinutesString
    }
    
    private func updateExercises() {
        currentExercise = 0
        let category = dataSourceCategory?.categories[currentCategory] ?? ""
        let exercisesForCategory = statisticCtrl?.getExercisesForCategory(category: category)
        totalExercises = exercisesForCategory?.count ?? 0
        dataSourceExercise?.exercises = exercisesForCategory ?? []
        collectionViewExercise.reloadData()
    }
    
    private func changeVisibility() {
        
        //Cardio
        if currentCategory == totalCategories - 1 {
            totalMinutes.isHidden = false
            totalMinutesHeader.isHidden = false
            
            for dataLabel in dataLabels {
                dataLabel.isHidden = true
            }
            for headerLabel in headerLabels {
                headerLabel.isHidden = true
            }
        }
        else {
            totalMinutes.isHidden = true
            totalMinutesHeader.isHidden = true
            
            for dataLabel in dataLabels {
                dataLabel.isHidden = false
            }
            for headerLabel in headerLabels {
                headerLabel.isHidden = false
            }
        }
    }

    @IBAction func nextCategory(_ sender: UIButton) {
        currentCategory += 1
        
        //Previous when first muscle displayed
        if currentCategory == totalCategories {
            currentCategory = 0
        }
        
        let nextItem: IndexPath = IndexPath(item: currentCategory, section: 0)
        collectionViewCategory.scrollToItem(at: nextItem, at: .right, animated: true)
        
        updateExercises()
        
        let firstExercise: IndexPath = IndexPath(item: currentExercise, section: 0)
        collectionViewExercise.scrollToItem(at: firstExercise, at: .left, animated: true)
        
        updateLabels()
        changeVisibility()
    }
    
    @IBAction func prevCategory(_ sender: UIButton) {
        currentCategory -= 1
        
        //Previous when first muscle displayed
        if currentCategory == -1 {
            currentCategory = totalCategories - 1
        }
        
        let prevItem: IndexPath = IndexPath(item: currentCategory, section: 0)
        collectionViewCategory.scrollToItem(at: prevItem, at: .left, animated: true)
        
        updateExercises()
        
        let firstExercise: IndexPath = IndexPath(item: currentExercise, section: 0)
        collectionViewExercise.scrollToItem(at: firstExercise, at: .left, animated: true)

        updateLabels()
        changeVisibility()
    }
    
    @IBAction func nextExercise(_ sender: UIButton) {
        currentExercise += 1
        
        //Previous when first muscle displayed
        if currentExercise == totalExercises {
            currentExercise = 0
        }
        
        let nextItem: IndexPath = IndexPath(item: currentExercise, section: 0)
        
        collectionViewExercise.scrollToItem(at: nextItem, at: .right, animated: true)
        updateLabels()
    }
    
    @IBAction func prevExercise(_ sender: UIButton) {
        currentExercise -= 1
        
        //Previous when first muscle displayed
        if currentExercise == -1 {
            currentExercise = totalExercises - 1
        }
        
        let prevItem: IndexPath = IndexPath(item: currentExercise, section: 0)
        
        collectionViewExercise.scrollToItem(at: prevItem, at: .left, animated: true)
        updateLabels()
    }
    
}
