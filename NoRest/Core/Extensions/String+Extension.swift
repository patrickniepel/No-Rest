//
//  String+Extension.swift
//  NoRest
//
//  Created by Patrick Niepel on 12.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

extension String {
    static func seconds(value: Int) -> String {
        return "\(value) s"
    }
    
    static func minutes(value: Int) -> String {
        return "\(value) min"
    }
    
    static func unit(value: Double) -> String {
        return "Todo"
    }
}

extension String {
    private func localized(_ tableName: String? = nil, bundle: Bundle, value: String = "", comment: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }

    var localized: String {
        return self.localized(bundle: Bundle.main)
    }

}
