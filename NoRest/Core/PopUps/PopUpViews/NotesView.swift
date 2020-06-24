//
//  NotesView.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NotesView: UIView {
    private lazy var notesTextView: UITextView = {
        let textView = UITextView()
        textView.autocapitalizationType = .sentences
        textView.autocorrectionType = .default
//        textView.font = UIFont(name: NRStyle.regularFont, size: NRStyle.fontSizeRegular)
        textView.isEditable = true
        textView.keyboardAppearance = .default
        textView.keyboardType = .default
        textView.layer.cornerRadius = 15
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return textView
    }()

    var notes: String = ""

    convenience init(notes: String) {
        self.init()
        self.notes = notes
        setup()
    }

    private func setup() {
        addSubview(notesTextView)
        notesTextView.fillSuperview()

        notesTextView.text = notes
    }

    func currentNotes() -> String {
        return notesTextView.text
    }
}
