//
//  AssetPalette.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

// swiftlint:disable force_unwrapping
struct AssetPalette: PaletteProtocol {
    let basic: BasicAssetPalette
    let onboarding: OnboardingAssetPalette

    static let light: AssetPalette = .init(
        basic: .light,
        onboarding: .light
    )

    static let dark: AssetPalette = .init(
        basic: .dark,
        onboarding: .dark
    )
}

struct BasicAssetPalette: PaletteProtocol {
    let workoutsIcon: UIImage
    let exercisesIcon: UIImage
    let statisticsIcon: UIImage
    let settingsIcon: UIImage
    let disclosureIcon: UIImage
    let timerIcon: UIImage
    let binIcon: UIImage
    let selectionIcon: UIImage
    let questionMarkIcon: UIImage
    let calendarIcon: UIImage
    let arrowIcon: UIImage
    let notesIcon: UIImage
    let startIcon: UIImage

    static var light: BasicAssetPalette = .init(workoutsIcon: NRStyle.buildImage(for: "workouts")!,
                                                exercisesIcon: NRStyle.buildImage(for: "exercises")!,
                                                statisticsIcon: NRStyle.buildImage(for: "statistics")!,
                                                settingsIcon: NRStyle.buildImage(for: "settings")!,
                                                disclosureIcon: NRStyle.buildImage(for: "disclosure")!,
                                                timerIcon: NRStyle.buildImage(for: "timer")!,
                                                binIcon: NRStyle.buildImage(for: "bin")!,
                                                selectionIcon: NRStyle.buildImage(for: "selection")!,
                                                questionMarkIcon: NRStyle.buildImage(for: "question_mark")!,
                                                calendarIcon: NRStyle.buildImage(for: "calendar")!,
                                                arrowIcon: NRStyle.buildImage(for: "arrow")!,
                                                notesIcon: NRStyle.buildImage(for: "notes")!,
                                                startIcon: NRStyle.buildImage(for: "start")!)

    static var dark: BasicAssetPalette = .light
}

struct OnboardingAssetPalette: PaletteProtocol {
    static var light: OnboardingAssetPalette = .init()
    static var dark: OnboardingAssetPalette = .init()
}
