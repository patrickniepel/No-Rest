//
//  EditExerciseViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class EditExerciseViewController: UIViewController {
    
    var exercise: Exercise?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select {
                $0.editExerciseState
            }
        }

        view.setupDefaultBackgroundColor()
    }
    
    func setupExercise(_ exercise: Exercise?) {
        self.exercise = exercise
    }
    
    deinit {
        store.unsubscribe(self)
    }
}
