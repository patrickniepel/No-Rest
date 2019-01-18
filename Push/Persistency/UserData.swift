//
//  UserData.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class UserData: NSObject, NSCoding {
    
    static var sharedInstance = UserData()
    
    var unit : String = "KG"
    var myWorkouts : [MyWorkout] = []
    var exercises : [String : [Exercise]] = [:]
    var statistics : Statistic = Statistic()
    var workoutHistory : WorkoutHistory = WorkoutHistory()
    var categories : [String] = ["Chest", "Back", "Shoulders", "Triceps", "Biceps", "Legs", "Abs", "Cardio"]
    
    private let unitKey = "unit"
    private let myWorkoutsKey = "myWorkout"
    private let exercisesKey = "exercisesKey"
    private let statisticsKey = "statisticsKey"
    private let workoutHistoryKey = "workoutHistoryKey"
    private let categoriesKey = "categoriesKey"
    
    private override init(){}
    
    required init?(coder aDecoder: NSCoder) {
        unit = aDecoder.decodeObject(forKey: unitKey) as? String ?? ""
        myWorkouts = aDecoder.decodeObject(forKey: myWorkoutsKey) as? [MyWorkout] ?? []
        exercises = aDecoder.decodeObject(forKey: exercisesKey) as? [String : [Exercise]] ?? [:]
        statistics = aDecoder.decodeObject(forKey: statisticsKey) as? Statistic ?? Statistic()
        workoutHistory = aDecoder.decodeObject(forKey: workoutHistoryKey) as? WorkoutHistory ?? WorkoutHistory()
        categories = aDecoder.decodeObject(forKey: categoriesKey) as? [String] ?? []
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(unit, forKey: unitKey)
        aCoder.encode(myWorkouts, forKey: myWorkoutsKey)
        aCoder.encode(exercises, forKey: exercisesKey)
        aCoder.encode(statistics, forKey: statisticsKey)
        aCoder.encode(workoutHistory, forKey: workoutHistoryKey)
        aCoder.encode(categories, forKey: categoriesKey)
    }
}
