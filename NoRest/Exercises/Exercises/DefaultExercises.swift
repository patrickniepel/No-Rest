//
//  DefaultExercises.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class DefaultExercises: NSObject {
    
    let exercises : [String : [Exercise]] =
        ["Chest" : [
            Exercise(aName: "Cable Crossover", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Decline Barbell Bench Press", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Flat Barbell Bench Press", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Flat Dumbbell Bench Press", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Flat Dumbbell Fly", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Hammer Strength Bench Press", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Incline Barbell Bench Press", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Incline Dumbbell Bench Press", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Incline Dumbbell Fly", aRestTime: 90, aNotes: "", aCategory: "Chest"),
            Exercise(aName: "Push Up", aRestTime: 90, aNotes: "", aCategory: "Chest")],

         "Back" : [
            Exercise(aName: "Barbell Row", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Barbell Shrug", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Chin Up", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Deadlift", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Dumbbell Row", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Hammer Strength Row", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Lat Pulldown", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Pull Up", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "Seated Cable Row", aRestTime: 90, aNotes: "", aCategory: "Back"),
            Exercise(aName: "T-Bar Row", aRestTime: 90, aNotes: "", aCategory: "Back")],

         "Shoulders" : [
            Exercise(aName: "Arnold Dumbbell Press", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Behind The Neck Barbell Press", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Cable Face Pull", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Front Dumbbell Raise", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Hammer Strength Shoulder Press", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Lateral Machine Raise", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Military Press", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Rear Delt Dumbbell Raise", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Seated Lateral Dumbbell Raise", aRestTime: 90, aNotes: "", aCategory: "Shoulders"),
            Exercise(aName: "Standing Lateral Dumbbell Raise", aRestTime: 90, aNotes: "", aCategory: "Shoulders")],

         "Biceps" : [
            Exercise(aName: "Barbell Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "Cable Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "Dumbbell Concentration Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "Dumbbell Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "Dumbbell Hammer Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "EZ-Bar Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "EZ-Bar Preacher Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "Iron Cross Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "Dumbbell Scott Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps"),
            Exercise(aName: "Seated Machine Curl", aRestTime: 90, aNotes: "", aCategory: "Biceps")],

         "Triceps" : [
            Exercise(aName: "Cable Overhead Triceps Extension", aRestTime: 90, aNotes: "", aCategory: "Triceps"),
            Exercise(aName: "Close Grip Barbell Bench Press", aRestTime: 90, aNotes: "", aCategory: "Triceps"),
            Exercise(aName: "Dumbbell Overhead Triceps Extension", aRestTime: 90, aNotes: "", aCategory: "Triceps"),
            Exercise(aName: "EZ-Bar French Press", aRestTime: 90, aNotes: "", aCategory: "Triceps"),
            Exercise(aName: "Triceps Dip", aRestTime: 90, aNotes: "", aCategory: "Triceps"),
            Exercise(aName: "Push Down", aRestTime: 90, aNotes: "", aCategory: "Triceps")],

         "Abs" : [
            Exercise(aName: "Crunch", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Crunch Machine", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Hanging Knee Raise", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Hanging Leg Raise", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Plank", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Russian Twist", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Side Plank", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Situp", aRestTime: 90, aNotes: "", aCategory: "Abs"),
            Exercise(aName: "Toes To Bar", aRestTime: 90, aNotes: "", aCategory: "Abs")],

         "Legs" : [
            Exercise(aName: "Barbell Calf Raise", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Barbell Front Squat", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Barbell Glute Bridge", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Barbell Squat", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Donkey Calf Raise", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Glute-Ham Raise", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Leg Extension Machine", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Leg Press", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Lying Leg Curl Machine", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Seated Calf Raise Machine", aRestTime: 90, aNotes: "", aCategory: "Legs"),
            Exercise(aName: "Standing Calf Raise Machine", aRestTime: 90, aNotes: "", aCategory: "Legs")],
    
        "Cardio" : [
            Exercise(aName: "Cross Trainer", aRestTime: 600, aNotes: "", aCategory: "Cardio"),
            Exercise(aName: "Treadmill", aRestTime: 600, aNotes: "", aCategory: "Cardio"),
            Exercise(aName: "Indoor Cycling", aRestTime: 600, aNotes: "", aCategory: "Cardio"),
            Exercise(aName: "Climbing Machine", aRestTime: 600, aNotes: "", aCategory: "Cardio"),
            ]]
}
