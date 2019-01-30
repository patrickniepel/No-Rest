//
//  MuscleStatisticViewController.swift
//  Push
//
//  Created by Patrick Niepel on 21.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

//class MuscleStatisticViewController: UIViewController {
//    
//    var statisticCtrl : StatisticsController?
//    var dataSource : MuscleStatisticDataSource?
//    var delegate : MuscleStatisticDelegateFlowLayout?
//    
//    //Labels for the data (no cardio labels)
//    @IBOutlet weak var maxWeight: UILabel!
//    @IBOutlet weak var totalVolume: UILabel!
//    @IBOutlet weak var totalReps: UILabel!
//    @IBOutlet weak var totalSets: UILabel!
//    @IBOutlet weak var percentOfWorkoutSets: UILabel!
//    @IBOutlet weak var totalVolumeOfMuscle: UILabel!
//    @IBOutlet weak var totalRepsOfMuscle: UILabel!
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    var dataLabels : [UILabel] = []
//    //Labels for the header (no cardio labels)
//    @IBOutlet var headerLabels: [UILabel]!
//    
//    
//    @IBOutlet weak var totalMinutes: UILabel!
//    @IBOutlet weak var totalMinutesHeader: UILabel!
//    
//    @IBOutlet weak var nextButton: UIButton!
//    @IBOutlet weak var previousButton: UIButton!
//    
//    @IBOutlet weak var topStack: UIStackView!
//    
//    var currentMuscle = 0
//    var totalMuscles = 0
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        dataLabels = [totalSets, percentOfWorkoutSets, totalVolumeOfMuscle, totalRepsOfMuscle]
//
//        statisticCtrl = StatisticsController()
//        dataSource = MuscleStatisticDataSource()
//        delegate = MuscleStatisticDelegateFlowLayout()
//        
//        collectionView.dataSource = dataSource
//        collectionView.delegate = delegate
//        
//        totalMuscles = dataSource?.muscles.count ?? 0
//        
//        statisticCtrl?.setup()
//        fillTopLabels()
//        updateLabels()
//        
//        totalMinutes.isHidden = true
//        totalMinutesHeader.isHidden = true
//    }
//    
//    //Three labels at the top of the screen, will get calculated only once
//    private func fillTopLabels() {
//        maxWeight.text = statisticCtrl?.getMaxWeight()
//        totalVolume.text = statisticCtrl?.getTotalVolume()
//        totalReps.text = statisticCtrl?.getTotalReps()
//    }
//    
//    private func updateLabels() {
//        let currentMuscleString = dataSource?.muscles[currentMuscle] ?? ""
//        totalSets.text = statisticCtrl?.getTotalSetsOfMuscle(for: currentMuscleString)
//        percentOfWorkoutSets.text = statisticCtrl?.getPercentageOfWorkoutSets(for: currentMuscleString)
//        totalVolumeOfMuscle.text = statisticCtrl?.getTotalVolumeOfMuscle(for: currentMuscleString)
//        totalRepsOfMuscle.text = statisticCtrl?.getTotalRepsOfMuscle(for: currentMuscleString)
//        totalMinutes.text = statisticCtrl?.getTotalMinutes()
//    }
//    
//    private func changeVisibility() {
//        
//        //Cardio
//        if currentMuscle == totalMuscles - 1 {
//            totalMinutes.isHidden = false
//            totalMinutesHeader.isHidden = false
//            
//            
//            for dataLabel in dataLabels {
//                dataLabel.isHidden = true
//            }
//            for headerLabel in headerLabels {
//                headerLabel.isHidden = true
//            }
//        }
//        else {
//            totalMinutes.isHidden = true
//            totalMinutesHeader.isHidden = true
//            
//            for dataLabel in dataLabels {
//                dataLabel.isHidden = false
//            }
//            for headerLabel in headerLabels {
//                headerLabel.isHidden = false
//            }
//        }
//    }
//    
//    @IBAction func nextMuscle(_ sender: UIButton) {
//        currentMuscle += 1
//        
//        //Next when last muscle is displayed
//        if currentMuscle == totalMuscles {
//            currentMuscle = 0
//        }
//
//        let nextItem: IndexPath = IndexPath(item: currentMuscle, section: 0)
//        
//        collectionView.scrollToItem(at: nextItem, at: .right, animated: true)
//        updateLabels()
//        changeVisibility()
//    }
//
//    @IBAction func previousMuscle(_ sender: UIButton) {
//        currentMuscle -= 1
//        
//        //Previous when first muscle displayed
//        if currentMuscle == -1 {
//            currentMuscle = totalMuscles - 1
//        }
//        
//        let prevItem: IndexPath = IndexPath(item: currentMuscle, section: 0)
//        
//        collectionView.scrollToItem(at: prevItem, at: .left, animated: true)
//        updateLabels()
//        changeVisibility()
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "muscleVC2exerciseStatisticVC" {
//            
//            let destVC = segue.destination as? ExerciseStatisticViewController
//            destVC?.statisticCtrl = statisticCtrl
//        }
//    }
//}
