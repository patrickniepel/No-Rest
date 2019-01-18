//
//  Exercise.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class Exercise: NSObject, NSCoding {
    
    //User will only see the next three values
    var name : String = ""
    var restTime : Int = 0
    var notes : String = ""//TODO : You can see the notes in the workout section for this exercise
    var explanation : String = ""
    
    //Set -> (Reps, Weight)
    var category : String = ""
    var sets : [[String : String]] = []
    var volume : Double = 0
    
    private let nameKey = "name"
    private let restTimeKey = "restTime"
    private let notesKey = "notes"
    private let categoryKey = "category"
    private let setsKey = "sets"
    private let volumeKey = "volume"
    private let explanationKey = "explanation"
    
    override init() {}
    
    init(aName: String, aRestTime: Int, aNotes: String, aCategory: String) {
        name = aName
        restTime = aRestTime
        notes = aNotes
        category = aCategory
    }
    
    init(aName: String, aRestTime: Int, aNotes: String, aCategory: String, aExplanation: String) {
        name = aName
        restTime = aRestTime
        notes = aNotes
        category = aCategory
        explanation = aExplanation
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: nameKey) as! String
        restTime = aDecoder.decodeInteger(forKey: restTimeKey)
        notes = aDecoder.decodeObject(forKey: notesKey) as! String
        category = aDecoder.decodeObject(forKey: categoryKey) as! String
        sets = aDecoder.decodeObject(forKey: setsKey) as! [[String : String]]
        volume = aDecoder.decodeDouble(forKey: volumeKey)
        explanation = aDecoder.decodeObject(forKey: explanationKey) as! String
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: nameKey)
        aCoder.encode(restTime, forKey: restTimeKey)
        aCoder.encode(notes, forKey: notesKey)
        aCoder.encode(category, forKey: categoryKey)
        aCoder.encode(sets, forKey: setsKey)
        aCoder.encode(volume, forKey: volumeKey)
        aCoder.encode(explanation, forKey: explanationKey)
    }
}
