//
//  StatisticsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct StatisticsController {
    private static var allExercisesOfStatistics: [Exercise] {
        return UserData.sharedInstance.statistics.allExercises()
    }
    
    static func provideGeneralStats() -> [StatsContainerItem] {
        let categories = Category.allCategories
        var stats: [StatsContainerItem] = []
        categories.forEach {
            let item = StatsContainerItem(title: $0.rawValue, stats: StatisticsController.stats(for: $0))
            stats.append(item)
        }

        return stats
    }
    
    static func provideExercisesStats() -> [StatsContainerItem] {
        var stats: [StatsContainerItem] = []
        let exercises = ExerciseController().allExercises()
        
        exercises.forEach {
            let item = StatsContainerItem(title: $0.name, stats: StatisticsController.stats(for: $0))
            stats.append(item)
        }
        
        return stats
    }
}

extension StatisticsController {
    
    static func stats(for exercise: Exercise) -> [Stat] {
        let exercises = allExercisesOfStatistics.filter { $0.id == exercise.id }
        
        if exercise.type == .cardio {
            return [Stat(title: .totalRunningTime, value: totalRunningTime(exercises: [exercise]))]
        }
        
        return [Stat(title: .totalSets, value: totalSets(exercises: exercises)),
                Stat(title: .maxWeight, value: maxWeight(exercises: exercises)),
                Stat(title: .totalVolume, value: totalVolume(exercises: exercises)),
                Stat(title: .avgVolumePerSet, value: avgVolumePerSet(exercises: exercises)),
                Stat(title: .avgRepsPerSet, value: avgRepsPerSet(exercises: exercises)),
                Stat(title: .totalReps, value: totalReps(exercises: exercises))]
    }
    
    static func stats(for category: Category) -> [Stat] {
        let exercises = allExercisesOfStatistics.filter { $0.category == category }
        
        if category == .none {
            return generalStats()
        }
        
        if category == .cardio {
            return [Stat(title: .totalRunningTime, value: totalRunningTime(exercises: exercises))]
        }
        
        return [Stat(title: .totalSets, value: totalSets(exercises: exercises)),
                Stat(title: .percentageOfSets, value: percentageOfSets(exercises: exercises)),
                Stat(title: .totalVolume, value: totalVolume(exercises: exercises)),
                Stat(title: .totalReps, value: totalReps(exercises: exercises))]
    }
    
    static func generalStats() -> [Stat] {
        
        return [Stat(title: .maxWeight, value: maxWeight(exercises: allExercisesOfStatistics)),
                Stat(title: .totalVolume, value: totalVolume(exercises: allExercisesOfStatistics)),
                Stat(title: .totalReps, value: totalReps(exercises: allExercisesOfStatistics))]
    }
    
    private static func maxWeight(exercises: [Exercise]) -> Double {
        let maxWeight = exercises.compactMap { $0.sets.compactMap { $0.weight }.max() }.max() ?? 0
        return maxWeight
    }
    
    private static func totalVolume(exercises: [Exercise]) -> Double {
        let volume = exercises.reduce(0, { (res, exercise) -> Double in
            res + exercise.sets.reduce(0, { (res, set) -> Double in
                res + Double(set.reps) * set.weight
            })
        })
        return volume
    }
    
    private static func totalReps(exercises: [Exercise]) -> Double {
        let reps = exercises.reduce(0, { (res, exercise) -> Double in
            res + exercise.sets.reduce(0, { (res, set) -> Double in
                res + Double(set.reps)
            })
        })
        return reps
    }
    
    private static func totalSets(exercises: [Exercise]) -> Double {
        let sets = exercises.reduce(0) { (res, exercise) -> Double in
            res + Double(exercise.sets.count)
        }
        return sets
    }
    
    private static func avgVolumePerSet(exercises: [Exercise]) -> Double {
        let totalVolume = self.totalVolume(exercises: exercises)
        let totalSets = self.totalSets(exercises: exercises)
        
        if totalSets == 0 {
            return 0
        }
        
        return totalVolume / totalSets
    }
    
    private static func avgRepsPerSet(exercises: [Exercise]) -> Double {
        let totalReps = self.totalReps(exercises: exercises)
        let totalSets = self.totalSets(exercises: exercises)
        
        if totalSets == 0 {
            return 0
        }
        
        return totalReps / totalSets
    }
    
    private static func totalRunningTime(exercises: [Exercise]) -> Double {
        var totalTimer: Double = 0
        
        for exercise in exercises {
            totalTimer += Double(exercise.timer.valueForType)
        }
        return totalTimer
    }
    
    private static func percentageOfSets(exercises: [Exercise]) -> Double {
        var percentage: Double = 0
        let setsForCategory = self.totalSets(exercises: exercises)
        let totalSets = self.totalSets(exercises: allExercisesOfStatistics)
        
        if totalSets == 0 {
            return 0
        }
        
        percentage = (setsForCategory / totalSets) * 100
        
        return percentage
    }
}


