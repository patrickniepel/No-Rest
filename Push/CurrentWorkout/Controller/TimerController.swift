//
//  TimerController.swift
//  Push
//
//  Created by Patrick Niepel on 20.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class TimerController: NSObject {
    
    func checkTimerValue(value: String) -> Bool {
        
        if value.isEmpty || value.count > 3 {
            return false
        }
        
        let valueCompare = value.startIndex..<value.endIndex
        let pattern = "^[1-9][0-9]{1,2}$|^\\d$"
        let res = value.range(of: pattern, options: .regularExpression)
        
        return res == valueCompare
    }
}
