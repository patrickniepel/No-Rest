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
        exercises = exerciseDictionary()
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
        let exercises = self.exercises.flatMap { $0.1 }
        guard
            let exercise = exercises.first(where: { $0.name.lowercased().contains(query.lowercased()) }),
            let type = exercise.type,
            let sectionIndex = ExerciseType.allCases.firstIndex(where: { $0 == type }),
            let rowIndex = self.exercises[type.rawValue]?.firstIndex(where: { $0.id == exercise.id }) else { return nil }
        
        let indexPath = IndexPath(row: rowIndex, section: sectionIndex)
        return indexPath
    }
    
    func generateNewExercise() -> Exercise {
        let name = "exercise.new".localized
        let id = UserDefaultsController.currentExerciseId
        UserDefaultsController.increaseExerciseId()
        return Exercise(id: id, name: name, type: .chest, timer: 90, icon: NRStyle.questionMarkIcon)
    }
    
    func deleteExercise(for indexPath: IndexPath) {
        let type = ExerciseType.allCases[indexPath.section].rawValue
        guard let exercisesForType = exercises[type] else { return }
        let exerciseToDelete = exercisesForType[indexPath.row]
        ExerciseObject.delete(with: exerciseToDelete.id)
    }
    
    static func addExercise(_ exercise: Exercise) {
        ExerciseObject.add(exercise: exercise)
    }
    
    func exerciseDictionary() -> [String: [Exercise]] {
        var dictionary: [String: [Exercise]] = [:]
        
        ExerciseType.allCases.forEach {
            dictionary[$0.rawValue] = ExerciseObject.exercises(for: $0).sorted().map{ Exercise(from: $0) }
        }
        
        return dictionary
    }
}
