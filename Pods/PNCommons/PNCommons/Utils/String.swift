//
//  String.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension String {
    
    /** Checks if the String is empty */
    var isBlank: Bool {
        return trimmed.isEmpty
    }
    
    /** Removes a new string without whitespaces */
    var trimmed: String {
        return trimmingCharacters(in: .whitespaces)
    }
    
    /**
     Removes whitespaces
     */
    mutating func trim() {
        let trimmedString = trimmingCharacters(in: .whitespaces)
        self = trimmedString
    }
    
    /**
     Converts a html string to an attributed string
     */
    func convertHTMLToAttributedString() -> NSAttributedString {
        guard let data = data(using: .utf16) else {
            return NSAttributedString()
        }
        do {
            return try
                NSMutableAttributedString(
                    data: data,
                    options: [.documentType : NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf16.rawValue],
                    documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
}

