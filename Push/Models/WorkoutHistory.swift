//
//  WorkoutHistory.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutHistory: NSObject, NSCoding {
    
    var workouts : [MyWorkout] = []
    private let workoutsKey = "workouts"
    
    override init() {}
    
    required init?(coder aDecoder: NSCoder) {
        workouts = aDecoder.decodeObject(forKey: workoutsKey) as? [MyWorkout] ?? []
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(workouts, forKey: workoutsKey)
    }

}
