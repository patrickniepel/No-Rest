//
//  AppReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(navigationState: navigationReducer(action: action, state: state?.navigationState),
                    editExerciseState: editExerciseReducer(action: action, state: state?.editExerciseState),
                    infoState: infoReducer(action: action, state: state?.infoState),
                    workoutState: workoutReducer(action: action, state: state?.workoutState),
                    exerciseSelectionState: exerciseSelectionReducer(action: action, state: state?.exerciseSelectionState),
                    popUpState: popUpReducer(action: action, state: state?.popUpState),
                    workoutSessionState: workoutSessionReducer(action: action, state: state?.workoutSessionState),
                    currentIconSelectionState: currentIconSelectionReducer(action: action, state: state?.currentIconSelectionState))
}
