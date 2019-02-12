//
//  LicensesViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 31.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class LicensesViewController: UIViewController {
    
    let licensesTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .mainColor
        tv.textColor = .white
        tv.isUserInteractionEnabled = false
        tv.text = "Lorem Ipsum"
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        view.setupDefaultBackgroundColor()
        navigationItem.title = NRConstants.ScreenTitles.licenses
        setupLicensesTextView()
    }
    
    private func setupLicensesTextView() {
        view.addSubview(licensesTextView)
        licensesTextView.fillSuperview()
    }
    
    @objc private func cancelButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
