//
//  MenuViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet var menuButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupLayout()
    }

    private func setupLayout() {
        
        logo.layer.cornerRadius = 25
        
        for button in menuButtons {
            button.layer.cornerRadius = 10
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
