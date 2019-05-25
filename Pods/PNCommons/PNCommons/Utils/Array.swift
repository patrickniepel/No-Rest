//
//  Array.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension Array where Element: Numeric {
    var sum: Element {
        return reduce(0, +)
    }
    
    var product: Element {
        return reduce(1, *)
    }
}

public extension Array where Element == String {
    var concatenated: Element {
        return reduce("", +)
    }
}

public extension Array where Element: Hashable {
    
    /**
     Removes all duplicates
     - returns: The new array without duplicates
     */
    @discardableResult
    mutating func unify() -> [Element] {
        let newArray = Array(Set(self))
        self = newArray
        return newArray
    }
    
    /**
     Only appends the value if there is no duplicate
     - parameter element: The element to append
     */
    mutating func appendUnique(_ element: Element) {
        if !contains(element) {
            append(element)
        }
    }
    
    /**
     Appends only unique values without changing the order of elements
     - parameter elements: The array of elements to append
     */
    mutating func appendUnique(_ elements: [Element]) {
        let uniques = elements.filter { !contains($0) }
        self += uniques
    }
    
    func intersection(with array: [Element]) -> [Element] {
        return Array(Set(self).intersection(Set(array)))
    }
    
    func union(with array: [Element]) -> [Element] {
        return Array(Set(self).union(Set(array)))
    }
}

public extension Array {
    
    /**
     Bounds-checked ("safe") index lookup for Arrays.
     Example usage:
     let foo = [0,1,2][safe: 1]    |    foo = (Int?) 1
     let bar = [0,1,2][safe: 10]   |    bar = (Int?) nil
    */
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }

    /**
     Appends the element if not nil
     - parameter newElement: The optional element to append
     */
    mutating func append(safe newElement: Element?) {
        if let element = newElement {
            append(element)
        }
    }
}
