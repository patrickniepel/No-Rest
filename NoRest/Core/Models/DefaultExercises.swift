//
//  DefaultExercises.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

struct DefaultExercise {
    
    static func createDefaultExercises() {
        let types = ExerciseType.allCases
        types.forEach {
            defaultExercises(for: $0)
        }
    }
    
    private static func defaultExercises(for type: ExerciseType) {
        var content: [(String, UIImage?)] = []
        switch type {
        case .chest:
            content = [
                ("exercises.cableCrossover".localized, NRStyle.cableCrossoverIcon),
                ("exercises.declineBarbellBenchPress".localized, nil),
                ("exercises.flatBarbellBenchPress".localized, NRStyle.flatBarbellBenchPressIcon),
                ("exercises.flatDumbbellBenchPress".localized, NRStyle.flatDumbbellBenchPressIcon),
                ("exercises.flatDumbbellFly".localized, nil),
                ("exercises.hammerStrengthBenchPress".localized, nil),
                ("exercises.inclineBarbellBenchPress".localized, NRStyle.inclineBarbellBenchPress),
                ("exercises.inclineDumbbellBenchPress".localized, nil),
                ("exercises.inclineDumbbellFly".localized, nil),
                ("exercises.pushUp".localized, NRStyle.pushUpIcon),
                ("exercises.machineFly".localized, NRStyle.machineFlyIcon)
            ]
        case .back:
            content = [
                ("exercises.barbellRow".localized, nil),
                ("exercises.barbellShrug".localized, nil),
                ("exercises.deadlift".localized, NRStyle.deadliftIcon),
                ("exercises.dumbbellRow".localized, NRStyle.dumbbellRowIcon),
                ("exercises.hammerStrengthRow".localized, NRStyle.hammerStrengthRowIcon),
                ("exercises.latPulldown".localized, NRStyle.latPulldownIcon),
                ("exercises.pullUp".localized, nil),
                ("exercises.seatedCableRow".localized, NRStyle.seatedCableRowIcon),
                ("exercises.tBarRow".localized, nil)
            ]
        case .shoulders:
            content = [
                ("exercises.arnoldDumbbellPress".localized, nil),
                ("exercises.dumbbellPress".localized, NRStyle.dumbbellPressIcon),
                ("exercises.behindTheNeckBarbellPress".localized, nil),
                ("exercises.cableFacePull".localized, nil),
                ("exercises.frontDumbbellRaise".localized, nil),
                ("exercises.hammerStrengthShoulderPress".localized, NRStyle.hammerStrengthShoulderPressIcon),
                ("exercises.lateralMachineRaise".localized, nil),
                ("exercises.militaryPress".localized, NRStyle.militaryPressIcon),
                ("exercises.rearDeltDumbbellRaise".localized, nil),
                ("exercises.seatedLateralDumbbellRaise".localized, nil),
                ("exercises.standingLateralDumbbellRaise".localized, NRStyle.standingLateralDumbbellRaiseIcon)
            ]
        case .biceps:
            content = [
                ("exercises.barbellCurl".localized, NRStyle.barbellCurlIcon),
                ("exercises.cableCurl".localized, nil),
                ("exercises.chinUp".localized, NRStyle.chinUpIcon),
                ("exercises.dumbbellConcentrationCurl".localized, NRStyle.dumbbellConcentrationCurl),
                ("exercises.dumbbellCurl".localized, NRStyle.dumbbellCurlIcon),
                ("exercises.dumbbellHammerCurl".localized, nil),
                ("exercises.ezBarCurl".localized, nil),
                ("exercises.ezBarPreacherCurl".localized, nil),
                ("exercises.ironCrossCurl".localized, nil),
                ("exercises.dumbbellScottCurl".localized, nil),
                ("exercises.seatedMachineCurl".localized, NRStyle.seatedMachineCurlIcon)
            ]
        case .triceps:
            content = [
                ("exercises.cableOverheadTricepsExtension".localized, nil),
                ("exercises.closeGripBarbellBenchPress".localized, NRStyle.closeGripBarbellBenchPressIcon),
                ("exercises.dumbbellOverheadTricepsExtension".localized, nil),
                ("exercises.ezBarFrenchPress".localized, nil),
                ("exercises.tricepsDip".localized, NRStyle.tricepsDipIcon),
                ("exercises.pushDown".localized, nil)
            ]
        case .abs:
            content = [
                ("exercises.crunch".localized, NRStyle.crunchIcon),
                ("exercises.crunchMachine".localized, nil),
                ("exercises.hangingKneeRaise".localized, nil),
                ("exercises.HangingLegRaise".localized, nil),
                ("exercises.plank".localized, NRStyle.plankIcon),
                ("exercises.russianTwist".localized, nil),
                ("exercises.sidePlank".localized, nil),
                ("exercises.situp".localized, NRStyle.situpIcon),
                ("exercises.toesToBar".localized, nil)
            ]
        case .legs:
            content = [
                ("exercises.barbellCalfRaise".localized, nil),
                ("exercises.barbellFrontSquat".localized, NRStyle.barbellFrontSquatIcon),
                ("exercises.barbellGluteBridge".localized, nil),
                ("exercises.barbellSquat".localized, NRStyle.barbellSquatIcon),
                ("exercises.donkeyCalfRaise".localized, nil),
                ("exercises.gluteHamRaise".localized, nil),
                ("exercises.legExtensionMachine".localized, nil),
                ("exercises.legPress".localized, NRStyle.legPressIcon),
                ("exercises.lyingLegCurlMachine".localized, nil),
                ("exercises.seatedCalfRaiseMachine".localized, nil),
                ("exercises.standingCalfRaiseMachine".localized, nil)
            ]
        case .cardio:
            content = [
                ("exercises.crossTrainer".localized, NRStyle.crossTrainerIcon),
                ("exercises.treadmill".localized, NRStyle.treadmillIcon),
                ("exercises.indoorCycling".localized, NRStyle.indoorCyclingIcon),
                ("exercises.climbingMachine".localized, nil),
                ("exercises.ropeSkipping".localized, NRStyle.ropeSkippingIcon)
            ]
        }
        
        createExercises(with: content, for: type)
    }
    
    private static func createExercises(with content: [(title: String, icon: UIImage?)], for type: ExerciseType) {
        content.forEach {
            let timer = type == .cardio ? 600 : 90
            let id = UserDefaultsController.currentExerciseId
            UserDefaultsController.increaseExerciseId()
            let newExercise = Exercise(id: id, name: $0.title, type: type, timer: timer, icon: $0.icon ?? NRStyle.exercisesIcon)
            ExerciseObject.add(exercise: newExercise)
        }
    }
}
