//
//  Stat.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct Stat {
    let title: StatsTitle
    let value: Double
}

enum StatsTitle: String, Codable {
    case maxWeight = "Max. Weight"
    case totalVolume = "Total Volume"
    case totalReps = "Total Reps"
    case totalSets = "Total Sets"
    case percentageOfSets = "% of Sets"
    case totalRunningTime = "Total Running Time"
    case avgVolumePerSet = "Avg. Volume Per Set"
    case avgRepsPerSet = "Avg. Reps Per Set"
}
