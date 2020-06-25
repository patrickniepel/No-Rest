//
//  NRStyle.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct NRStyle {
    // Padding
    static let horizontalPadding: CGFloat = 20
    static let verticalPadding: CGFloat = 16
    static let cornerRadius: CGFloat = 15

    // Images
    static let workoutsIcon = buildImage(for: "workouts")
    static let exercisesIcon = buildImage(for: "exercises")
    static let statisticsIcon = buildImage(for: "statistics")
    static let settingsIcon = buildImage(for: "settings")
    static let questionMarkIcon = buildImage(for: "question_mark")

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

    static func buildImage(for name: String) -> UIImage? {
        return UIImage(named: name)
    }
}
