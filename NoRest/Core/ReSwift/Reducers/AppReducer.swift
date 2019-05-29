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
                    exercisesState: exercisesReducer(action: action, state: state?.exercisesState),
                    settingsState: settingsReducer(action: action, state: state?.settingsState),
                    editExerciseState: editExerciseReducer(action: action, state: state?.editExerciseState),
                    infoState: infoReducer(action: action, state: state?.infoState),
                    myWorkoutState: myWorkoutReducer(action: action, state: state?.myWorkoutState),
                    workoutSettingState: workoutSettingReducer(action: action, state: state?.workoutSettingState),
                    workoutSortingState: workoutSortingReducer(action: action, state: state?.workoutSortingState),
                    popUpState: popUpReducer(action: action, state: state?.popUpState),
                    currentWorkoutState: currentWorkoutReducer(action: action, state: state?.currentWorkoutState),
                    currentWorkoutCellState: currentWorkoutCellReducer(action: action, state: state?.currentWorkoutCellState))
}


