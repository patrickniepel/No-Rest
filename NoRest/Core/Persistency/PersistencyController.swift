//
//  PersistencyController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct PersistencyController: Codable {
    
    enum OnboardingType {
        case startWorkout
        case exercises
        case history
        
        var key: String {
            switch self {
            case .startWorkout: return NRConstants.Onboarding.startWorkoutKey
            case .exercises: return NRConstants.Onboarding.exercisesKey
            case .history: return NRConstants.Onboarding.historyKey
            }
        }
    }
    
    static func loadUserData() {
        if let userData = FileController.loadData() {
            UserData.sharedInstance = userData
        }
        
        if UserData.sharedInstance.exercises.isEmpty {
            UserData.sharedInstance.exercises = DefaultExercise.allExercises()
            storeUserData()
        }
    }
    
    static func storeUserData() {
        FileController.storeData(data: UserData.sharedInstance)
    }
    
    static func currentWorkoutID() -> Int {
        let id = UserDefaults.standard.integer(forKey: NRConstants.DataIdentifiers.currentWorkoutID) + 1
        storeCurrentWorkoutID(id)
        return id
    }
    
    private static func storeCurrentWorkoutID(_ id: Int) {
        UserDefaults.standard.set(id, forKey: NRConstants.DataIdentifiers.currentWorkoutID)
    }
    
    static func currentExerciseID() -> Int {
        let id = UserDefaults.standard.integer(forKey: NRConstants.DataIdentifiers.currentExerciseID) + 1
        storeCurrentExerciseID(id)
        return id
    }
    
    private static func storeCurrentExerciseID(_ id: Int) {
        UserDefaults.standard.set(id, forKey: NRConstants.DataIdentifiers.currentExerciseID)
    }
    
    static func storeOnboarding(type: OnboardingType) {
        UserDefaults.standard.set(true, forKey: type.key)
    }
    
    static func didShowOnboarding(type: OnboardingType) -> Bool {
        return UserDefaults.standard.bool(forKey: type.key)
    }
    
    static func resetOnboarding() {
        UserDefaults.standard.set(false, forKey: OnboardingType.startWorkout.key)
        UserDefaults.standard.set(false, forKey: OnboardingType.history.key)
        UserDefaults.standard.set(false, forKey: OnboardingType.exercises.key)
    }
}
