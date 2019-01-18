//
//  NotesExplanationViewController.swift
//  Push
//
//  Created by Patrick Niepel on 19.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

protocol NotesExplanationSegueDelegate {
    func backFromNotesExplanationScreen(ctrl: NotesExplanationViewController)
}

class NotesExplanationViewController: UIViewController, UITextViewDelegate {

    var delegate : NotesExplanationSegueDelegate? = nil
    var currentExercise : Exercise!
    var textToShow : Int!

    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        closeButton.layer.cornerRadius = 10
        textView.layer.cornerRadius = 10
        
        if textToShow == 0 {
            textView.text = currentExercise.notes.trimmingCharacters(in: .whitespaces).isEmpty ? "No Notes Yet" : currentExercise.notes
        }
        else if textToShow == 1 {
            textView.text = currentExercise.explanation.trimmingCharacters(in: .whitespaces).isEmpty ? "No Explanation Yet" : currentExercise.explanation
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func closeNotesExplanation(_ sender: UIButton) {
        
        //Notes
        if textToShow == 0 {
            currentExercise.notes = textView.text
        }
        //Explanation
        else if textToShow == 1 {
            currentExercise.explanation = textView.text
        }
        delegate!.backFromNotesExplanationScreen(ctrl: self)
    }
}
