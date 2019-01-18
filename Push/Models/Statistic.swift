//
//  Statistic.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class Statistic: NSObject, NSCoding {
    
    var statisticsData : [MyWorkout] = []
    private let statisticsDataKey = "statisticsData"
    
    override init() {}
    
    required init?(coder aDecoder: NSCoder) {
        statisticsData = aDecoder.decodeObject(forKey: statisticsDataKey) as! [MyWorkout]
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(statisticsData, forKey: statisticsDataKey)
    }
}
