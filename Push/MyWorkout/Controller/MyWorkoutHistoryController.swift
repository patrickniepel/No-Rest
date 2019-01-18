//
//  MyWorkoutHistoryController.swift
//  Push
//
//  Created by Patrick Niepel on 14.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutHistoryController: NSObject {
    
    var userData = UserData.sharedInstance
    
    func loadHistory() -> WorkoutHistory {
        return userData.workoutHistory
    }

}
