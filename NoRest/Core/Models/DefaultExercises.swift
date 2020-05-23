//
//  DefaultExercises.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

struct DefaultExercise {
    
    static func allExercises() -> [Exercise] {
        let types = ExerciseType.allCases
        var exercises: [Exercise] = []
        
        for type in types {
            exercises += DefaultExercise.defaultExercises(for: type)
        }
        
        return exercises
    }
    
    static func defaultExercises(for type: ExerciseType) -> [Exercise] {
        var titles: [String] = []
        switch type {
        case .chest:
            titles = [
                "exercises.cableCrossover".localized,
                "exercises.declineBarbellBenchPress".localized,
                "exercises.flatBarbellBenchPress".localized,
                "exercises.flatDumbbellBenchPress".localized,
                "exercises.flatDumbbellFly".localized,
                "exercises.hammerStrengthBenchPress".localized,
                "exercises.inclineBarbellBenchPress".localized,
                "exercises.inclineDumbbellBenchPress".localized,
                "exercises.inclineDumbbellFly".localized,
                "exercises.pushUp".localized
            ]
        case .back:
            titles = [
                "exercises.barbellRow".localized,
                "exercises.barbellShrug".localized,
                "exercises.chinUp".localized,
                "exercises.deadlift".localized,
                "exercises.dumbbellRow".localized,
                "exercises.hammerStrengthRow".localized,
                "exercises.latPulldown".localized,
                "exercises.pullUp".localized,
                "exercises.seatedCableRow".localized,
                "exercises.tBarRow".localized
            ]
        case .shoulders:
            titles = [
                "exercises.arnoldDumbbellPress".localized,
                "exercises.behindTheNeckBarbellPress".localized,
                "exercises.cableFacePull".localized,
                "exercises.frontDumbbellRaise".localized,
                "exercises.hammerStrengthShoulderPress".localized,
                "exercises.lateralMachineRaise".localized,
                "exercises.militaryPress".localized,
                "exercises.rearDeltDumbbellRaise".localized,
                "exercises.seatedLateralDumbbellRaise".localized,
                "exercises.standingLateralDumbbellRaise".localized
            ]
        case .biceps:
            titles = [
                "exercises.barbellCurl".localized,
                "exercises.cableCurl".localized,
                "exercises.dumbbellConcentrationCurl".localized,
                "exercises.dumbbellCurl".localized,
                "exercises.dumbbellHammerCurl".localized,
                "exercises.ezBarCurl".localized,
                "exercises.ezBarPreacherCurl".localized,
                "exercises.ironCrossCurl".localized,
                "exercises.dumbbellScottCurl".localized,
                "exercises.seatedMachineCurl".localized
            ]
        case .triceps:
            titles = [
                "exercises.cableOverheadTricepsExtension".localized,
                "exercises.closeGripBarbellBenchPress".localized,
                "exercises.dumbbellOverheadTricepsExtension".localized,
                "exercises.ezBarFrenchPress".localized,
                "exercises.tricepsDip".localized,
                "exercises.pushDown".localized
            ]
        case .abs:
            titles = [
                "exercises.crunch".localized,
                "exercises.crunchMachine".localized,
                "exercises.hangingKneeRaise".localized,
                "exercises.HangingLegRaise".localized,
                "exercises.plank".localized,
                "exercises.russianTwist".localized,
                "exercises.sidePlank".localized,
                "exercises.situp".localized,
                "exercises.toesToBar".localized
            ]
        case .legs:
            titles = [
                "exercises.barbellCalfRaise".localized,
                "exercises.barbellFrontSquat".localized,
                "exercises.barbellGluteBridge".localized,
                "exercises.barbellSquat".localized,
                "exercises.donkeyCalfRaise".localized,
                "exercises.gluteHamRaise".localized,
                "exercises.legExtensionMachine".localized,
                "exercises.legPress".localized,
                "exercises.lyingLegCurlMachine".localized,
                "exercises.seatedCalfRaiseMachine".localized,
                "exercises.standingCalfRaiseMachine".localized
            ]
        case .cardio:
            titles = [
                "exercises.crossTrainer".localized,
                "exercises.treadmill".localized,
                "exercises.indoorCycling".localized,
                "exercises.climbingMachine".localized
            ]
        }
        return createExercises(with: titles, for: type)
    }
    
    private static func createExercises(with titles: [String], for type: ExerciseType) -> [Exercise] {
        var exercises: [Exercise] = []
        for title in titles {
            let timer = type == .cardio ? 600 : 90
            let newExercise = Exercise(name: title, type: type, timer: timer, image: NRStyle.exercisesIcon)
            exercises.append(newExercise)
        }
        return exercises
    }
}
