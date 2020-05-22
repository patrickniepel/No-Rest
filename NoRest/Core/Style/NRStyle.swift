//
//  NRStyle.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct NRStyle {
    // Colors
    static let themeColor = UIColor.rgb(red: 51, green: 55, blue: 69, alpha: 1) // #333745
    static let complementaryColor = UIColor.rgb(red: 0, green: 253, blue: 255, alpha: 1) // #00FDFF
    static let primaryTextColor: UIColor = .white
    static let secondaryTextColor = UIColor.rgb(red: 200, green: 200, blue: 200, alpha: 1)
    
    static let black: UIColor = .black
    
    static let pulsatingColor = UIColor.rgb(red: 275, green: 108, blue: 31, alpha: 1)
    static let warningColor = UIColor.rgb(red: 254, green: 95, blue: 85, alpha: 1) // #FE5F55
    static let successColor = UIColor.rgb(red: 199, green: 239, blue: 207, alpha: 1) // #C7EFCF
    
    // Padding
    static let horizontalPadding: CGFloat = 20
    
    // Fonts
    static let regularFont = "CaviarDreams"
    static let boldFont = "CaviarDreams-Bold"

    // Font sizes
    static let fontSizeViewControllerTitle: CGFloat = 35
    static let fontSizeVerySmall: CGFloat = 10
    static let fontSizeSmall: CGFloat = 14
    static let fontSizeRegular: CGFloat = 18
    static let fontSizeMedium: CGFloat = 20
    static let fontSizeLarge: CGFloat = 24
    
    // Images
    static let workoutsIcon = buildImage(for: "workouts")
    static let exercisesIcon = buildImage(for: "exercises")
    static let statisticsIcon = buildImage(for: "statistics")
    static let settingsIcon = buildImage(for: "settings")
    static let disclosureIcon = buildImage(for: "next")
    
    private static func buildImage(for name: String) -> UIImage? {
        return UIImage(named: name)
    }
}
