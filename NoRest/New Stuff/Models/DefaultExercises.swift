//
//  DefaultExercises.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

struct DefaultExercise {
    
    static func allExercises() -> [Exercise] {
        let categories = Category.allCategories
        var exercises: [Exercise] = []
        
        for category in categories {
            exercises += DefaultExercise.defaultExercises(for: category)
        }
        
        return exercises
    }
    
    static func defaultExercises(for category: Category) -> [Exercise] {
        
        switch category {
        case .chest:
            return [
                Exercise(name: "Cable Crossover", category: .chest),
                Exercise(name: "Decline Barbell Bench Press", category: .chest),
                Exercise(name: "Flat Barbell Bench Press", category: .chest),
                Exercise(name: "Flat Dumbbell Bench Press", category: .chest),
                Exercise(name: "Flat Dumbbell Fly", category: .chest),
                Exercise(name: "Hammer Strength Bench Press", category: .chest),
                Exercise(name: "Incline Barbell Bench Press", category: .chest),
                Exercise(name: "Incline Dumbbell Bench Press", category: .chest),
                Exercise(name: "Incline Dumbbell Fly", category: .chest),
                Exercise(name: "Push Up", category: .chest)]
        case .back:
            return [
                Exercise(name: "Barbell Row", category: .back),
                Exercise(name: "Barbell Shrug", category: .back),
                Exercise(name: "Chin Up", category: .back),
                Exercise(name: "Deadlift", category: .back),
                Exercise(name: "Dumbbell Row", category: .back),
                Exercise(name: "Hammer Strength Row", category: .back),
                Exercise(name: "Lat Pulldown", category: .back),
                Exercise(name: "Pull Up", category: .back),
                Exercise(name: "Seated Cable Row", category: .back),
                Exercise(name: "T-Bar Row", category: .back)]
        case .shoulders:
            return [
                Exercise(name: "Arnold Dumbbell Press", category: .shoulders),
                Exercise(name: "Behind The Neck Barbell Press", category: .shoulders),
                Exercise(name: "Cable Face Pull", category: .shoulders),
                Exercise(name: "Front Dumbbell Raise", category: .shoulders),
                Exercise(name: "Hammer Strength Shoulder Press", category: .shoulders),
                Exercise(name: "Lateral Machine Raise", category: .shoulders),
                Exercise(name: "Military Press", category: .shoulders),
                Exercise(name: "Rear Delt Dumbbell Raise", category: .shoulders),
                Exercise(name: "Seated Lateral Dumbbell Raise", category: .shoulders),
                Exercise(name: "Standing Lateral Dumbbell Raise", category: .shoulders)]
        case .biceps:
            return [
                Exercise(name: "Barbell Curl", category: .biceps),
                Exercise(name: "Cable Curl", category: .biceps),
                Exercise(name: "Dumbbell Concentration Curl", category: .biceps),
                Exercise(name: "Dumbbell Curl", category: .biceps),
                Exercise(name: "Dumbbell Hammer Curl", category: .biceps),
                Exercise(name: "EZ-Bar Curl", category: .biceps),
                Exercise(name: "EZ-Bar Preacher Curl", category: .biceps),
                Exercise(name: "Iron Cross Curl", category: .biceps),
                Exercise(name: "Dumbbell Scott Curl", category: .biceps),
                Exercise(name: "Seated Machine Curl", category: .biceps)]
        case .triceps:
            return [
                Exercise(name: "Cable Overhead Triceps Extension", category: .triceps),
                Exercise(name: "Close Grip Barbell Bench Press", category: .triceps),
                Exercise(name: "Dumbbell Overhead Triceps Extension", category: .triceps),
                Exercise(name: "EZ-Bar French Press", category: .triceps),
                Exercise(name: "Triceps Dip", category: .triceps),
                Exercise(name: "Push Down", category: .triceps)]
        case .abs:
            return [
                Exercise(name: "Crunch", category: .abs),
                Exercise(name: "Crunch Machine", category: .abs),
                Exercise(name: "Hanging Knee Raise", category: .abs),
                Exercise(name: "Hanging Leg Raise", category: .abs),
                Exercise(name: "Plank", category: .abs),
                Exercise(name: "Russian Twist", category: .abs),
                Exercise(name: "Side Plank", category: .abs),
                Exercise(name: "Situp", category: .abs),
                Exercise(name: "Toes To Bar", category: .abs)]
        case .legs:
            return [
                Exercise(name: "Barbell Calf Raise", category: .legs),
                Exercise(name: "Barbell Front Squat", category: .legs),
                Exercise(name: "Barbell Glute Bridge", category: .legs),
                Exercise(name: "Barbell Squat", category: .legs),
                Exercise(name: "Donkey Calf Raise", category: .legs),
                Exercise(name: "Glute-Ham Raise", category: .legs),
                Exercise(name: "Leg Extension Machine", category: .legs),
                Exercise(name: "Leg Press", category: .legs),
                Exercise(name: "Lying Leg Curl Machine", category: .legs),
                Exercise(name: "Seated Calf Raise Machine", category: .legs),
                Exercise(name: "Standing Calf Raise Machine", category: .legs)]
        case .cardio:
            return [
                Exercise(name: "Cross Trainer", category: .cardio, timer: 10, type: .cardio),
                Exercise(name: "Treadmill", category: .cardio, timer: 10, type: .cardio),
                Exercise(name: "Indoor Cycling", category: .cardio, timer: 10, type: .cardio),
                Exercise(name: "Climbing Machine", category: .cardio, timer: 10, type: .cardio)]
        }
    }
}
