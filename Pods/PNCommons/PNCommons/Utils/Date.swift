//
//  Date.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension Date {
    
    /**
     Checks if this date instance is between the specified start and end date
     - parameter startDate: The desired start date
     - parameter endDate: The desired end date
     - parameter isEndInclusive: Specifies if this date instance can be euqal to the end date. The default value is 'true'
     - returns: True if this date instance is between the specified start and end date
     */
    func isBetween(startDate: Date, and endDate: Date, isEndInclusive: Bool = true) -> Bool {
        if isEndInclusive {
            return (min(startDate, endDate) ... max(startDate, endDate)).contains(self)
        }
        else {
            return (min(startDate, endDate) ..< max(startDate, endDate)).contains(self)
        }
    }
    
    /**
     Creates a date object
     - parameter year: The year value of the date
     - parameter month: The month value of the date
     - parameter day: The day value of the date
     - returns: The date object
     */
    static func of(year: Int, month: Int, day: Int) -> Date? {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = gregorianCalendar?.date(from: dateComponents) ?? nil
        return date
    }
    
    /**
     Creates a date object from its string representation
     - parameter string: The string representation of the date
     - parameter format: The desired format of the date. The default value is 'yyyy-MM-dd'
     - returns: The date object
     */
    static func create(from string: String, format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format
        
        let date = dateFormatter.date(from: string) ?? nil
        return date
    }
    
    /**
     Returns a string representation of the specified date with its specified format
     - parameter date: The date object to convert into a string value
     - parameter format: The desired format of the date object
     - returns: The string representation of the date object
     */
    static func withFormat(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
