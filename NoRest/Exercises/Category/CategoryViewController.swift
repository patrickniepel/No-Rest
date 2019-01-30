//
//  CategoryViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

//class CategoryViewController: UIViewController {
//    
//    var selectedCategory : String?
//    @IBOutlet var categoryButtons: [UIButton]!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupLayout()
//    }
//    
//    private func setupLayout() {
//        
//        for button in categoryButtons {
//            button.layer.cornerRadius = 10
//        }
//    }
//    
//    @IBAction func categorySelected(_ sender: UIButton) {
//        
//        if let categoryString = sender.titleLabel?.text {
//            selectedCategory = categoryString
//        }
//        else {
//            selectedCategory = "Error"
//        }
//        
//        performSegue(withIdentifier: "categoryVC2exercisesTVC", sender: nil)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "categoryVC2exercisesTVC" {
//            
//            let destVC = segue.destination as? ExercisesTableViewController
//            destVC?.selectedCategory = selectedCategory
//        }
//    }
//}
