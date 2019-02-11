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
        static let fontBold = "CaviarDreams_Bold"
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
        static let statistics = "Statistics"
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
        static let statisticsCategorySelectorCollectionViewCell = "statisticsCategorySelectorCollectionViewCell"
        static let statisticsExerciseSelectorCollectionViewCell = "statisticsExerciseSelectorCollectionViewCell"
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
            static let rating = "Rate This App"
        }
        
        static let deleteButton = "Reset"
        static let cancelButton = "Cancel"
        static let successful = "Successful"
        static let alertMessage = "Are You Sure?"
        static let copyright = "© 2019 Patrick Niepel"
    }
}
