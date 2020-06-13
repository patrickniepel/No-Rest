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
                ("exercises.cableCrossover", NRStyle.cableCrossoverIcon),
                ("exercises.declineBarbellBenchPress", nil),
                ("exercises.flatBarbellBenchPress", NRStyle.flatBarbellBenchPressIcon),
                ("exercises.flatDumbbellBenchPress", NRStyle.flatDumbbellBenchPressIcon),
                ("exercises.flatDumbbellFly", nil),
                ("exercises.hammerStrengthBenchPress", nil),
                ("exercises.inclineBarbellBenchPress", NRStyle.inclineBarbellBenchPress),
                ("exercises.inclineDumbbellBenchPress", nil),
                ("exercises.inclineDumbbellFly", nil),
                ("exercises.pushUp", NRStyle.pushUpIcon),
                ("exercises.machineFly", NRStyle.machineFlyIcon)
            ]
        case .back:
            content = [
                ("exercises.barbellRow", nil),
                ("exercises.barbellShrug", nil),
                ("exercises.deadlift", NRStyle.deadliftIcon),
                ("exercises.dumbbellRow", NRStyle.dumbbellRowIcon),
                ("exercises.hammerStrengthRow", NRStyle.hammerStrengthRowIcon),
                ("exercises.latPulldown", NRStyle.latPulldownIcon),
                ("exercises.pullUp", nil),
                ("exercises.seatedCableRow", NRStyle.seatedCableRowIcon),
                ("exercises.tBarRow", nil)
            ]
        case .shoulders:
            content = [
                ("exercises.arnoldDumbbellPress", nil),
                ("exercises.dumbbellPress", NRStyle.dumbbellPressIcon),
                ("exercises.behindTheNeckBarbellPress", nil),
                ("exercises.cableFacePull", nil),
                ("exercises.frontDumbbellRaise", nil),
                ("exercises.hammerStrengthShoulderPress", NRStyle.hammerStrengthShoulderPressIcon),
                ("exercises.lateralMachineRaise", nil),
                ("exercises.militaryPress", NRStyle.militaryPressIcon),
                ("exercises.rearDeltDumbbellRaise", nil),
                ("exercises.seatedLateralDumbbellRaise", nil),
                ("exercises.standingLateralDumbbellRaise", NRStyle.standingLateralDumbbellRaiseIcon)
            ]
        case .biceps:
            content = [
                ("exercises.barbellCurl", NRStyle.barbellCurlIcon),
                ("exercises.cableCurl", nil),
                ("exercises.chinUp", NRStyle.chinUpIcon),
                ("exercises.dumbbellConcentrationCurl", NRStyle.dumbbellConcentrationCurl),
                ("exercises.dumbbellCurl", NRStyle.dumbbellCurlIcon),
                ("exercises.dumbbellHammerCurl", nil),
                ("exercises.ezBarCurl", nil),
                ("exercises.ezBarPreacherCurl", nil),
                ("exercises.ironCrossCurl", nil),
                ("exercises.dumbbellScottCurl", nil),
                ("exercises.seatedMachineCurl", NRStyle.seatedMachineCurlIcon)
            ]
        case .triceps:
            content = [
                ("exercises.cableOverheadTricepsExtension", nil),
                ("exercises.closeGripBarbellBenchPress", NRStyle.closeGripBarbellBenchPressIcon),
                ("exercises.dumbbellOverheadTricepsExtension", nil),
                ("exercises.ezBarFrenchPress", nil),
                ("exercises.tricepsDip", NRStyle.tricepsDipIcon),
                ("exercises.pushDown", nil)
            ]
        case .abs:
            content = [
                ("exercises.crunch", NRStyle.crunchIcon),
                ("exercises.crunchMachine", nil),
                ("exercises.hangingKneeRaise", nil),
                ("exercises.HangingLegRaise", nil),
                ("exercises.plank", NRStyle.plankIcon),
                ("exercises.russianTwist", nil),
                ("exercises.sidePlank", nil),
                ("exercises.situp", NRStyle.situpIcon),
                ("exercises.toesToBar", nil)
            ]
        case .legs:
            content = [
                ("exercises.barbellCalfRaise", nil),
                ("exercises.barbellFrontSquat", NRStyle.barbellFrontSquatIcon),
                ("exercises.barbellGluteBridge", nil),
                ("exercises.barbellSquat", NRStyle.barbellSquatIcon),
                ("exercises.donkeyCalfRaise", nil),
                ("exercises.gluteHamRaise", nil),
                ("exercises.legExtensionMachine", nil),
                ("exercises.legPress", NRStyle.legPressIcon),
                ("exercises.lyingLegCurlMachine", nil),
                ("exercises.seatedCalfRaiseMachine", nil),
                ("exercises.standingCalfRaiseMachine", nil)
            ]
        case .cardio:
            content = [
                ("exercises.crossTrainer", NRStyle.crossTrainerIcon),
                ("exercises.treadmill", NRStyle.treadmillIcon),
                ("exercises.indoorCycling", NRStyle.indoorCyclingIcon),
                ("exercises.climbingMachine", nil),
                ("exercises.ropeSkipping", NRStyle.ropeSkippingIcon)
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
