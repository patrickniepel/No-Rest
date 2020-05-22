//
//  NRTableViewSection.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.03.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

class NRTableViewSection<T> {
    let sectionTitle: String
    let items: [T]
    
    init(sectionTitle: String, items: [T]) {
        self.sectionTitle = sectionTitle
        self.items = items
    }
}
