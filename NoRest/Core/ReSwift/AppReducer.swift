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
                    workoutSetupState: workoutSetupReducer(action: action, state: state?.workoutSetupState),
                    workoutSortingState: workoutSortingReducer(action: action, state: state?.workoutSortingState),
                    popUpState: popUpReducer(action: action, state: state?.popUpState),
                    currentWorkoutState: currentWorkoutReducer(action: action, state: state?.currentWorkoutState),
                    currentWorkoutCellState: currentWorkoutCellReducer(action: action, state: state?.currentWorkoutCellState),
                    historyDetailState: historyDetailReducer(action: action, state: state?.historyDetailState),
                    currentIconSelectionState: currentIconSelectionReducer(action: action, state: state?.currentIconSelectionState))
}


