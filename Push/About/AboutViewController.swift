//
//  AboutViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import StoreKit

class AboutViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var rateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.layer.cornerRadius = 25
        rateButton.layer.cornerRadius = 10
        rateButton.layer.borderWidth = 2
        rateButton.layer.borderColor = UIColor(red: 31/255, green: 134/255, blue: 248/255, alpha: 1).cgColor
    }
    
    @IBAction func rateApp(_ sender: UIButton) {
        
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
}
