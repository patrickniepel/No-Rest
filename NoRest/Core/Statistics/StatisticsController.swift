//
//  StatisticsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

// swiftlint:disable trailing_whitespace
struct StatisticsController {
    private static var allExercisesOfStatistics: [Exercise] {
        return []
    }
    
    static func provideGeneralStats() -> [StatsContainerItem] {
        let categories = ExerciseType.allCases
        var stats: [StatsContainerItem] = []
        categories.forEach {
            let item = StatsContainerItem(title: $0.displayName, stats: StatisticsController.stats(for: $0))
            stats.append(item)
        }

        return stats
    }
    
    static func provideExercisesStats() -> [StatsContainerItem] {
        var stats: [StatsContainerItem] = []
        let exercises: [Exercise] = []
        
        exercises.forEach {
            let item = StatsContainerItem(title: $0.name, stats: StatisticsController.stats(for: $0))
            stats.append(item)
        }
        
        return stats
    }
}

private extension StatisticsController {
    
    static func stats(for exercise: Exercise) -> [Stat] {
        let exercises = allExercisesOfStatistics.filter { $0.id == exercise.id }
        
        if exercise.type == .cardio {
            return [Stat(title: .totalRunningTime, value: totalRunningTime(exercises: [exercise]), type: .nonDecimal)]
        }
        
        return [Stat(title: .totalSets, value: totalSets(exercises: exercises), type: .nonDecimal),
                Stat(title: .maxWeight, value: maxWeight(exercises: exercises), type: .decimal),
                Stat(title: .totalVolume, value: totalVolume(exercises: exercises), type: .decimal),
                Stat(title: .avgVolumePerSet, value: avgVolumePerSet(exercises: exercises), type: .decimal),
                Stat(title: .avgRepsPerSet, value: avgRepsPerSet(exercises: exercises), type: .nonDecimal),
                Stat(title: .totalReps, value: totalReps(exercises: exercises), type: .nonDecimal)]
    }
    
    static func stats(for type: ExerciseType) -> [Stat] {
        let exercises = allExercisesOfStatistics.filter { $0.type == type }
        
        return [Stat(title: .totalSets, value: totalSets(exercises: exercises), type: .nonDecimal),
                Stat(title: .percentageOfSets, value: percentageOfSets(exercises: exercises), type: .decimal),
                Stat(title: .totalVolume, value: totalVolume(exercises: exercises), type: .decimal),
                Stat(title: .totalReps, value: totalReps(exercises: exercises), type: .nonDecimal)]
    }
    
    static func generalStats() -> [Stat] {
        
        return [Stat(title: .maxWeight, value: maxWeight(exercises: allExercisesOfStatistics), type: .decimal),
                Stat(title: .totalVolume, value: totalVolume(exercises: allExercisesOfStatistics), type: .decimal),
                Stat(title: .totalReps, value: totalReps(exercises: allExercisesOfStatistics), type: .nonDecimal)]
    }
    
    static func maxWeight(exercises: [Exercise]) -> Double {
        let maxWeight = exercises.compactMap { $0.sets.compactMap { $0.weight }.max() }.max() ?? 0
        return maxWeight
    }
    
    static func totalVolume(exercises: [Exercise]) -> Double {
        let volume = exercises.reduce(0, { res, exercise -> Double in
            res + exercise.sets.reduce(0, { res, set -> Double in
                res + Double(set.reps) * set.weight
            })
        })
        return volume
    }
    
    static func totalReps(exercises: [Exercise]) -> Double {
        let reps = exercises.reduce(0, { res, exercise -> Double in
            res + exercise.sets.reduce(0, { res, set -> Double in
                res + Double(set.reps)
            })
        })
        return reps
    }
    
    static func totalSets(exercises: [Exercise]) -> Double {
        let sets = exercises.reduce(0) { res, exercise -> Double in
            res + Double(exercise.sets.count)
        }
        return sets
    }
    
    static func avgVolumePerSet(exercises: [Exercise]) -> Double {
        let totalVolume = self.totalVolume(exercises: exercises)
        let totalSets = self.totalSets(exercises: exercises)
        
        if totalSets == 0 {
            return 0
        }
        
        return totalVolume / totalSets
    }
    
    static func avgRepsPerSet(exercises: [Exercise]) -> Double {
        let totalReps = self.totalReps(exercises: exercises)
        let totalSets = self.totalSets(exercises: exercises)
        
        if totalSets == 0 {
            return 0
        }
        
        return totalReps / totalSets
    }
    
    static func totalRunningTime(exercises: [Exercise]) -> Double {
        var totalTimer: Double = 0
        
        for exercise in exercises {
            totalTimer += Double(exercise.timer)
        }
        return totalTimer
    }
    
    static func percentageOfSets(exercises: [Exercise]) -> Double {
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
