//
//  NRConstants.swift
//  Push
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

struct NRConstants {
    
    struct Text {
        static let font = "CaviarDreams"
        static let fontBold = "CaviarDreams-Bold"
    }
    
    struct TabBarItemTitles {
        static let addWorkout = "Workout"
        static let exercises = "Exercises"
        static let statistics = "Statistics"
        static let settings = "Settings"
    }
    
    struct ScreenTitles {
        static let myWorkout = "My Workout"
        static let categories = "Categories"
        static let settings = "Settings"
        static let licenses = "Licenses"
        static let disclaimer = "Disclaimer"
        static let statistics = "Statistics"
        static let newExercise = "New Exercise"
        static let newWorkout = "New Workout"
    }
    
    struct CellIdentifiers {
        static let exercisesCategoryCollectionViewCell = "exercisesCategoryCollectionViewCell"
        static let exercisesCollectionViewCell = "exercisesCollectionViewCell"
        static let settingsUnitTableViewCell = "settingsUnitTableViewCell"
        static let settingsTimerTableViewCell = "settingsTimerTableViewCell"
        static let settingsYourDataTableViewCell = "settingsYourDataTableViewCell"
        static let settingsDefaultTableViewCell = "settingsDefaultTableViewCell"
        static let statisticsGeneralCollectionViewCell = "mainStatisticsGeneralCollectionViewCell"
        static let statisticsExerciseCollectionViewCell = "mainStatisticsExerciseCollectionViewCell"
        static let statisticsStatsCollectionViewCell = "statisticsStatsCollectionViewCell"
        static let statisticsSelectorCollectionViewCell = "statisticsSelectorCollectionViewCell"
    }
    
    struct Padding {
        static let collectionViewItem: CGFloat = 32
    }
    
    struct DataIdentifiers {
        static let currentWorkoutID = "CurrentWorkoutID"
        static let currentExerciseID = "CurrentExerciseID"
        static let userDataKey  = "UserDataObject"
        static let fileName = "userData.plist"
    }
    
    struct ExerciseEditing {
        static let nameLabel = "Name"
        static let restTimerLabel = "Rest Timer (s)"
        static let runningTimerLabel = "Running Timer (min)"
        static let notesLabel = "Notes"
        static let noNotes = "No Entries Yet"
        static let noName = "Exercise - No Name"
        static let noTimer = 0
    }
    
    struct Settings {
        
        struct SectionTitles {
            static let general = "General"
            static let yourData = "Your Data"
            static let about = "About"
        }
        
        struct RowTitles {
            static let unit = "Unit"
            static let timer = "Timer Sound"
            static let workoutHistory = "Reset Workout History"
            static let statistics = "Reset Statistics"
            static let licences = "Licences"
            static let disclaimer = "Disclaimer"
            static let rating = "Rate This App"
        }
        
        static let resetButton = "Reset"
        static let cancelButton = "Cancel"
        static let copyright = "© 2019 Patrick Niepel"
    }
    
    struct Alerts {
        static let successful = "Successful"
        static let alertMessage = "Are You Sure?"
        static let errorSavingFailure = "Couldn't Be Saved"
        static let savingSuccess = "Saved"
    }
}
