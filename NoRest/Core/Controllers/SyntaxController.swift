//
//  SyntaxController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct SyntaxController {
    
    static func checkNameInputCorrect(text: String?) -> String {
        guard let text = text, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return NRConstants.Editing.noName
        }
        return text
    }
    
    static func checkTimerInputCorrect(text: String?) -> Int {
        guard let text = text, let numberAsInt = Int(text) else {
            return NRConstants.Editing.noTimer
        }
        return numberAsInt
    }
    
    static func checkNotesInputCorrect(text: String) -> String {
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return NRConstants.Editing.noNotes
        }
        return text
    }
}
