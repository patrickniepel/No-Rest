//
//  NRConstants.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

struct NRConstants {
    
    struct Font {
        static let font = "CaviarDreams"
        static let fontBold = "CaviarDreams-Bold"
    }
    
    struct TableViews {
        static let rowHeight: CGFloat = 65
        static let sectionHeight: CGFloat = TableViews.rowHeight * 0.75
    }

    struct TabBarItemTitles {
        static let myWorkout = "My Workout"
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
        static let history = "History"
        static let sorting = "Sorting"
        static let currentWorkout = "Current Workout"
    }
    
    struct CellIdentifiers {
        static let exercisesCategoryCollectionViewCell = "exercisesCategoryCollectionViewCell"
        static let settingsUnitTableViewCell = "settingsUnitTableViewCell"
        static let settingsTimerTableViewCell = "settingsTimerTableViewCell"
        static let settingsYourDataTableViewCell = "settingsYourDataTableViewCell"
        static let statsCollectionViewCell = "statsCollectionViewCell"
        static let statsContainerCollectionViewCell = "statsContainerCollectionViewCell"
        static let nrDefaultTableViewCell = "nrDefaultTableViewCell"
        static let historyTableViewCell = "historyTableViewCell"
        static let historyCollectionViewCell = "historyCollectionViewCell"
        static let emptyCollectionViewCell = "emptyCollectionViewCell"
        static let itemCollectionViewCell = "itemCollectionViewCell"
        static let statsHeaderView = "statsHeaderView"
        static let currentWorkoutCollectionViewCell = "currentWorkoutCollectionViewCell"
        static let setsTableViewCell = "setsTableViewCell"
        static let historyDetailCollectionViewCell = "historyDetailCollectionViewCell"
        static let historyDetailSetsTableViewCell = "historyDetailSetsTableViewCell"
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
    
    struct Editing {
        static let nameLabel = "Name"
        static let restTimerLabel = "Rest Timer (s)"
        static let runningTimerLabel = "Running Timer (min)"
        static let notesLabel = "Notes"
        static let noNotes = "No Entries Yet"
        static let noName = "No Name"
        static let noTimer = 0
    }
    
    struct Texts {
        static let emptyWorkouts = "No Workouts Available"
        static let emptyExercises = "No Exercises Available"
        static let noExercisesSelected = "No Exercises Selected"
        static let reps = "Reps"
        static let weight = "Weight"
        static let sets = "Sets"
    }
    
    struct Date {
        static let workoutNotStarted = "Not Started Yet"
        static let defaultFormat = "EEEE, MMMM dd yyyy"
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
        
        static let copyright = "© 2019 Patrick Niepel - v2.0.0"
    }
    
    struct ButtonTitles {
        static let resetButton = "Reset"
        static let cancelButton = "Cancel"
        static let deleteButton = "Delete"
        static let sortingButton = "Continue"
        static let add = "Add"
        static let update = "Update"
    }
    
    struct Alerts {
        static let successful = "Successful"
        static let alertMessage = "Are You Sure?"
        static let savingError = "Couldn't Be Saved"
        static let savingSuccess = "Saved"
    }
    
    struct Animations {
        static let pulsatingAnimationKey = "pulsatingAnimationKey"
        static let transformScaleKeyPath = "transform.scale"
    }
    
    enum Images: String {
        case play
        case bin
        case date
        case timer
        case notes
        case x
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
}
