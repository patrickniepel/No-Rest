//
//  MyWorkout.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkout: NSObject, NSCoding {
    
    var name : String = ""
    var date : String = ""
    var exercises : [Exercise] = []
    
    private let nameKey = "name"
    private let dateKey = "date"
    private let exercisesKey = "exercises"
    
    override init() {}
    
    init(aName: String, aExercises: [Exercise]) {
        name = aName
        exercises = aExercises
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: nameKey) as? String ?? ""
        date = aDecoder.decodeObject(forKey: dateKey) as? String ?? ""
        exercises = aDecoder.decodeObject(forKey: exercisesKey) as? [Exercise] ?? []
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: nameKey)
        aCoder.encode(date, forKey: dateKey)
        aCoder.encode(exercises, forKey: exercisesKey)
    }
}
