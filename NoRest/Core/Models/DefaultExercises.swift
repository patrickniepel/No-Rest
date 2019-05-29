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
        let categories = Category.allMuscleCategories
        var exercises: [Exercise] = []
        
        for category in categories {
            exercises += DefaultExercise.defaultExercises(for: category)
        }
        
        return exercises
    }
    
    static func defaultExercises(for category: Category) -> [Exercise] {
        var titles: [String] = []
        switch category {
        case .none:
            return []
        case .chest:
            titles = [
                "Cable Crossover",
                "Decline Barbell Bench Press",
                "Flat Barbell Bench Press",
                "Flat Dumbbell Bench Press",
                "Flat Dumbbell Fly",
                "Hammer Strength Bench Press",
                "Incline Barbell Bench Press",
                "Incline Dumbbell Bench Press",
                "Incline Dumbbell Fly",
                "Push Up"
            ]
        case .back:
            titles = [
                "Barbell Row",
                "Barbell Shrug",
                "Chin Up",
                "Deadlift",
                "Dumbbell Row",
                "Hammer Strength Row",
                "Lat Pulldown",
                "Pull Up",
                "Seated Cable Row",
                "T-Bar Row"
            ]
        case .shoulders:
            titles = [
                "Arnold Dumbbell Press",
                "Behind The Neck Barbell Press",
                "Cable Face Pull",
                "Front Dumbbell Raise",
                "Hammer Strength Shoulder Press",
                "Lateral Machine Raise",
                "Military Press",
                "Rear Delt Dumbbell Raise",
                "Seated Lateral Dumbbell Raise",
                "Standing Lateral Dumbbell Raise"
            ]
        case .biceps:
            titles = [
                "Barbell Curl",
                "Cable Curl",
                "Dumbbell Concentration Curl",
                "Dumbbell Curl",
                "Dumbbell Hammer Curl",
                "EZ-Bar Curl",
                "EZ-Bar Preacher Curl",
                "Iron Cross Curl",
                "Dumbbell Scott Curl",
                "Seated Machine Curl"
            ]
        case .triceps:
            titles = [
                "Cable Overhead Triceps Extension",
                "Close Grip Barbell Bench Press",
                "Dumbbell Overhead Triceps Extension",
                "EZ-Bar French Press",
                "Triceps Dip",
                "Push Down"
            ]
        case .abs:
            titles = [
                "Crunch",
                "Crunch Machine",
                "Hanging Knee Raise",
                "Hanging Leg Raise",
                "Plank",
                "Russian Twist",
                "Side Plank",
                "Situp",
                "Toes To Bar"
            ]
        case .legs:
            titles = [
                "Barbell Calf Raise",
                "Barbell Front Squat",
                "Barbell Glute Bridge",
                "Barbell Squat",
                "Donkey Calf Raise",
                "Glute-Ham Raise",
                "Leg Extension Machine",
                "Leg Press",
                "Lying Leg Curl Machine",
                "Seated Calf Raise Machine",
                "Standing Calf Raise Machine"
            ]
        case .cardio:
            titles = [
                "Cross Trainer",
                "Treadmill",
                "Indoor Cycling",
                "Climbing Machine"
            ]
        }
        return createExercises(with: titles, for: category)
    }
    
    private static func createExercises(with titles: [String], for category: Category) -> [Exercise] {
        var exercises: [Exercise] = []
        for title in titles {
            let newExercise = Exercise(name: title, category: category)
            exercises.append(newExercise)
        }
        return exercises
    }
}
