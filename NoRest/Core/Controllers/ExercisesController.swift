//
//  ExercisesController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

class ExercisesController {
    private var exercises: [String: [Exercise]] = [:]
    
    init() {
        updateExercises()
    }
    
    func updateExercises() {
        exercises = Exercise.asDictionary()
    }
    
    func numberOfSections() -> Int {
        return exercises.keys.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return exercises[ExerciseType.allCases[section].rawValue]?.count ?? 0
    }
    
    func exercise(for indexPath: IndexPath) -> Exercise? {
        return exercises[ExerciseType.allCases[indexPath.section].rawValue]?[indexPath.row]
    }
    
    func searchResult(for query: String) -> IndexPath? {
        let exercises = Exercise.all()
        guard
            let exercise = exercises.first(where: { $0.name.lowercased().contains(query.lowercased()) }),
            let type = exercise.type,
            let sectionIndex = ExerciseType.allCases.firstIndex(where: { $0 == type }),
            let rowIndex = Exercise.exercises(for: type).firstIndex(of: exercise) else { return nil }
        
        let indexPath = IndexPath(row: rowIndex, section: sectionIndex)
        return indexPath
    }
    
    func generateNewExercise() -> Exercise {
        let count = Exercise.all().count + 1
        let name = "exercise.new".localized + " \(count)"
        return Exercise(name: name, type: .chest, timer: 90, notes: "", image: NRStyle.questionMarkIcon)
    }
    
    func deleteExercise(for indexPath: IndexPath) {
        let type = ExerciseType.allCases[indexPath.section].rawValue
        guard let exercisesForType = exercises[type] else { return }
        let exerciseToDelete = exercisesForType[indexPath.row]
        Exercise.delete(with: exerciseToDelete.id)
    }
    
    static func addExercise(_ exercise: Exercise) {
        Exercise.add(exercise: exercise)
    }
}
