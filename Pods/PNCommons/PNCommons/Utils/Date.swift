//
//  Date.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension Date {
    func isBetween(startDate: Date, and endDate: Date, isEndInclusive: Bool = true) -> Bool {
        if isEndInclusive {
            return (min(startDate, endDate) ... max(startDate, endDate)).contains(self)
        }
        else {
            return (min(startDate, endDate) ..< max(startDate, endDate)).contains(self)
        }
    }
    
    static func of(year: Int, month: Int, day: Int) -> Date? {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = gregorianCalendar?.date(from: dateComponents) ?? nil
        return date
    }
    
    static func parse(_ string: String, format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format
        
        let date = dateFormatter.date(from: string) ?? nil
        return date
    }
    
    static func withFormat(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
