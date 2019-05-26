//
//  NotesView.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NotesView: UIView {
    
    private let notesTextView: UITextView = {
        let textView = UITextView()
        textView.autocapitalizationType = .sentences
        textView.autocorrectionType = .default
        textView.font = UIFont(name: NRConstants.Font.font, size: .fontSizeRegular)
        textView.isEditable = true
        textView.keyboardAppearance = .default
        textView.keyboardType = .default
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
    }()
    
    var notes: String = ""

    convenience init(notes: String) {
        self.init()
        self.notes = notes
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    private func setup() {
        addSubview(notesTextView)
        notesTextView.fillSuperview(padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        
        notesTextView.text = notes
    }
    
    func currentNotes() -> String {
        return SyntaxController.checkNotesInputCorrect(text: notesTextView.text)
    }

}
