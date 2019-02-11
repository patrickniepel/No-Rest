//
//  StatisticsController.swift
//  Push
//
//  Created by Patrick Niepel on 21.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

//class StatisticsController: NSObject {
//    
//    var workouts = UserData.sharedInstance.statistics.statisticsData
//    
//    var allSets : [[String : String]] = []
//    var allExercises : [Exercise] = []
//    var allExerciseArrays : [[Exercise]] = []
//    
//    func setup() {
//        
//        for workout in workouts {
//            allExerciseArrays.append(workout.exercises)
//        }
//        
//        for exerciseArray in allExerciseArrays {
//            for exercise in exerciseArray {
//                allExercises.append(exercise)
//            }
//        }
//        
//        for exercise in allExercises {
//            for set in exercise.sets {
//                allSets.append(set)
//            }
//        }
//    }
//    
//    func getExercisesForCategory(category: String) -> [Exercise] {
//        return UserData.sharedInstance.exercises[category] ?? []
//    }
//    
///** MUSCLES ************************************************************************************************/
//    
//    
//    /** Calculates the max weight out of all workouts */
//    func getMaxWeight() -> String {
//        
//        var weights : [Double] = []
//        
//        for set in allSets {
//            
//            var currentSet = set
//            
//            if currentSet["weight"]?.contains(",") ?? false {
//                if let commaIndex = currentSet["weight"]?.index(of: ",") {
//                    currentSet["weight"]?.remove(at: commaIndex)
//                    currentSet["weight"]?.insert(".", at: commaIndex)
//                }
//            }
//            guard let weight = Double(currentSet["weight"] ?? "") else { continue }
//            weights.append(weight)
//        }
//        
//        guard let maxWeight = weights.max() else { return "0" }
//        
//        return "\(maxWeight)" + "\(UserData.sharedInstance.unit)"
//    }
//    
//    /** Calculates the total volume out of all workouts */
//    func getTotalVolume() -> String {
//        
//        var totalVolume : Double = 0
//        
//        for set in allSets {
//            
//            var currentSet = set
//            
//            guard let reps = Double(currentSet["reps"] ?? "") else { continue }
//            
//            if currentSet["weight"]?.contains(",") ?? false {
//                if let commaIndex = currentSet["weight"]?.index(of: ",") {
//                    currentSet["weight"]?.remove(at: commaIndex)
//                    currentSet["weight"]?.insert(".", at: commaIndex)
//                }
//            }
//            
//            guard let weight = Double(currentSet["weight"] ?? "") else { continue }
//            
//            totalVolume += (reps * weight)
//        }
//        
//        return "\(totalVolume)" + "\(UserData.sharedInstance.unit)"
//    }
//    
//    /** Calculates the total reps out of all workouts */
//    func getTotalReps() -> String {
//        
//        var totalReps = 0
//        
//        for set in allSets {
//            
//            if let reps = Int(set["reps"] ?? "") {
//                totalReps += reps
//            }
//        }
//        
//        return "\(totalReps)"
//    }
//    
//    func getTotalSetsOfMuscle(for muscle: String) -> String {
//        
//        var totalSets = 0
//        
//        for exercise in allExercises {
//            
//            if muscle == exercise.category {
//                totalSets += exercise.sets.count
//            }
//        }
//        
//        return "\(totalSets)"
//    }
//    
//    func getTotalVolumeOfMuscle(for muscle: String) -> String {
//        
//        var totalVolume : Double = 0
//        
//        for exercise in allExercises {
//            
//            if muscle == exercise.category {
//                
//                for set in exercise.sets {
//                    
//                    var currentSet = set
//                    
//                    guard let reps = Double(currentSet["reps"] ?? "") else { continue }
//                    
//                    if currentSet["weight"]?.contains(",") ?? false {
//                        if let commaIndex = currentSet["weight"]?.index(of: ",") {
//                            currentSet["weight"]?.remove(at: commaIndex)
//                            currentSet["weight"]?.insert(".", at: commaIndex)
//                        }
//                    }
//                    
//                    guard let weight = Double(currentSet["weight"] ?? "") else { continue }
//                    
//                    totalVolume += (reps * weight)
//                }
//            }
//        }
//        
//         return "\(totalVolume)" + "\(UserData.sharedInstance.unit)"
//    }
//    
//    func getPercentageOfWorkoutSets(for muscle: String) -> String {
//        
//        let totalSets = allSets.count
//        
//        if totalSets == 0 {
//            return "0%"
//        }
//        
//        var totalSetsMuscle = 0
//        
//        for exercise in allExercises {
//            
//            if muscle == exercise.category {
//                totalSetsMuscle += exercise.sets.count
//            }
//        }
//        
//        let percentage : Double = Double(totalSetsMuscle) / Double(totalSets) * 100
//        let rounded = Double(round(100 * percentage) / 100)
//        
//        return "\(rounded)%"
//    }
//    
//    func getTotalRepsOfMuscle(for muscle: String) -> String {
//
//        var totalRepsMuscle = 0
//        
//        for exercise in allExercises {
//            
//            if muscle == exercise.category {
//                
//                for set in exercise.sets {
//                    
//                    guard let reps = Int(set["reps"] ?? "") else { continue }
//                    
//                    totalRepsMuscle += reps
//                }
//            }
//        }
//        
//        return "\(totalRepsMuscle)"
//    }
//    
//    func getTotalMinutes() -> String {
//        
//        var totalSeconds = 0
//        
//        for exercise in allExercises {
//            
//            if exercise.category == "Cardio" {
//                totalSeconds += exercise.restTime
//            }
//        }
//        
//        return "\(totalSeconds / 60)"
//    }
//    
//
///* EXERCISES *********************************************************************************************/
//    
//    
//    func getTotalSets(for exercise: String) -> String {
//        
//        var totalSets = 0
//        
//        for e in allExercises {
//            
//            if e.name == exercise {
//                totalSets += e.sets.count
//            }
//        }
//        
//        return "\(totalSets)"
//    }
//    
//    func getMaxWeight(for exercise: String) -> String {
//        
//        var weights : [Double] = []
//        
//        for e in allExercises {
//            
//            if e.name == exercise {
//                
//                for set in e.sets {
//                    
//                    var currentSet = set
//                    
//                    if currentSet["weight"]?.contains(",") ?? false {
//                        if let commaIndex = currentSet["weight"]?.index(of: ",") {
//                            currentSet["weight"]?.remove(at: commaIndex)
//                            currentSet["weight"]?.insert(".", at: commaIndex)
//                        }
//                    }
//                    
//                    guard let weight = Double(currentSet["weight"] ?? "") else { continue }
//                    weights.append(weight)
//                }
//            }
//        }
//        guard let maxWeight = weights.max() else { return "0" }
//        
//        return "\(maxWeight)"
//    }
//    
//    func getTotalVolume(for exercise: String) -> String {
//        
//        var totalVolume : Double = 0
//        
//        for e in allExercises {
//            
//            if e.name == exercise {
//                
//                for set in e.sets {
//                    
//                    var currentSet = set
//                    
//                    guard let reps = Double(set["reps"] ?? "") else { continue }
//                    
//                    if currentSet["weight"]?.contains(",") ?? false {
//                        if let commaIndex = currentSet["weight"]?.index(of: ",") {
//                            currentSet["weight"]?.remove(at: commaIndex)
//                            currentSet["weight"]?.insert(".", at: commaIndex)
//                        }
//                    }
//                    
//                    guard let weight = Double(currentSet["weight"] ?? "") else { continue }
//                    
//                    totalVolume += (reps * weight)
//                }
//            }
//        }
//        
//        if totalVolume == 0 {
//            return "0"
//        }
//        
//        return "\(totalVolume)"
//    }
//    
//    func getAvgVolume(totalSets: String, totalVolume: String) -> String {
//        
//        guard let sets = Double(totalSets) else { return "0" }
//        guard let volume = Double(totalVolume) else { return "0" }
//        
//        if sets == 0 {
//            return "0"
//        }
//        
//        let average : Double = volume / sets
//        let rounded = Double(round(100 * average) / 100)
//        
//        return "\(rounded)"
//    }
//    
//    func getTotalReps(for exercise: String) -> String {
//        
//        var totalReps = 0
//        
//        for e in allExercises {
//            
//            if e.name == exercise {
//                
//                for set in e.sets {
//                    
//                    guard let reps = Int(set["reps"] ?? "") else { continue }
//                    
//                    totalReps += reps
//                }
//            }
//        }
//        return "\(totalReps)"
//    }
//    
//    func getAvgReps(totalSets: String, totalReps: String) -> String {
//        
//        guard let sets = Double(totalSets) else { return "0" }
//        guard let reps = Double(totalReps) else { return "0" }
//        
//        if sets == 0 {
//            return "0"
//        }
//        
//        let average : Double = reps / sets
//        let rounded = Double(round(100 * average) / 100)
//        
//        return "\(rounded)"
//    }
//    
//    func getTotalMinutes(for exercise: String) -> String {
//        
//        var totalSeconds = 0
//        
//        for e in allExercises {
//            
//            if e.name == exercise {
//                
//                totalSeconds += e.restTime
//            }
//        }
//        
//        return "\(totalSeconds / 60)"
//    }
//    
//
//}
