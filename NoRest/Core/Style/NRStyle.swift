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
    
    static let pulsatingColor = UIColor.rgb(red: 275, green: 108, blue: 31, alpha: 1)
    static let warningColor = UIColor.rgb(red: 254, green: 95, blue: 85, alpha: 1) // #FE5F55
    static let successColor = UIColor.rgb(red: 199, green: 239, blue: 207, alpha: 1) // #C7EFCF
    
    // Padding
    static let horizontalPadding: CGFloat = 20
    static let verticalPadding: CGFloat = 16
    static let cornerRadius: CGFloat = 15
    
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
    static let fontSizeVeryLarge: CGFloat = 30
    
    // Images
    static let workoutsIcon = buildImage(for: "workouts")
    static let exercisesIcon = buildImage(for: "exercises")
    static let statisticsIcon = buildImage(for: "statistics")
    static let settingsIcon = buildImage(for: "settings")
    static let disclosureIcon = buildImage(for: "next")
    static let timerIcon = buildImage(for: "timer")
    static let binIcon = buildImage(for: "bin")
    static let selectionIcon = buildImage(for: "selection")
    static let questionMarkIcon = buildImage(for: "question_mark")
    static let calendarIcon = buildImage(for: "calendar")
    
    // Custom Icons
    static let absIcon = buildImage(for: "abs")
    static let legIcon = buildImage(for: "leg")
    static let armIcon = buildImage(for: "arm")
    static let backIcon = buildImage(for: "back")
    static let chestIcon = buildImage(for: "chest")
    static let smartwatchIcon = buildImage(for: "smartwatch")
    static let yogaIcon = buildImage(for: "yoga")
    static let cardioIcon = buildImage(for: "cardio")
    static let fatIcon = buildImage(for: "fat")
    static let dumbbellIcon = buildImage(for: "dumbbell")
    static let bodyIcon = buildImage(for: "body")
    
    // Exercises
    // Chest
    static let cableCrossoverIcon = buildImage(for: "cableCrossover")
    static let flatBarbellBenchPressIcon = buildImage(for: "flatBarbellBenchPress")
    static let flatDumbbellBenchPressIcon = buildImage(for: "flatDumbbellBenchPress")
    static let inclineBarbellBenchPress = buildImage(for: "inclineBarbellBenchPress")
    static let pushUpIcon = buildImage(for: "pushUp")
    static let machineFlyIcon = buildImage(for: "machineFly")
    
    // Back
    static let deadliftIcon = buildImage(for: "deadlift")
    static let dumbbellRowIcon = buildImage(for: "dumbbellRow")
    static let hammerStrengthRowIcon = buildImage(for: "hammerStrengthRow")
    static let latPulldownIcon = buildImage(for: "latPulldown")
    static let seatedCableRowIcon = buildImage(for: "seatedCableRow")
    
    // Shoulders
    static let dumbbellPressIcon = buildImage(for: "dumbbellPress")
    static let hammerStrengthShoulderPressIcon = buildImage(for: "hammerStrengthShoulderPress")
    static let militaryPressIcon = buildImage(for: "militaryPress")
    static let standingLateralDumbbellRaiseIcon = buildImage(for: "standingLateralDumbbellRaise")
    
    // Biceps
    static let barbellCurlIcon = buildImage(for: "barbellCurl")
    static let dumbbellConcentrationCurl = buildImage(for: "dumbbellConcentrationCurl")
    static let dumbbellCurlIcon = buildImage(for: "dumbbellCurl")
    static let seatedMachineCurlIcon = buildImage(for: "seatedMachineCurl")
    static let chinUpIcon = buildImage(for: "chinUp")
    
    // Triceps
    static let closeGripBarbellBenchPressIcon = buildImage(for: "closeGripBarbellBenchPress")
    static let tricepsDipIcon = buildImage(for: "tricepsDip")
    
    // Abs
    static let crunchIcon = buildImage(for: "crunch")
    static let plankIcon = buildImage(for: "plank")
    static let situpIcon = buildImage(for: "situp")
    
    // Legs
    static let barbellFrontSquatIcon = buildImage(for: "barbellFrontSquat")
    static let barbellSquatIcon = buildImage(for: "barbellSquat")
    static let legPressIcon = buildImage(for: "legPress")
    
    // Cardio
    static let crossTrainerIcon = buildImage(for: "crossTrainer")
    static let treadmillIcon = buildImage(for: "treadmill")
    static let indoorCyclingIcon = buildImage(for: "indoorCycling")
    static let ropeSkippingIcon = buildImage(for: "ropeSkipping")
    
    private static func buildImage(for name: String) -> UIImage? {
        return UIImage(named: name)
    }
}
