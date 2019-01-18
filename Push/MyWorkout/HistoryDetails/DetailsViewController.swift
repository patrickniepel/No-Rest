//
//  DetailsViewController.swift
//  Push
//
//  Created by Patrick Niepel on 15.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var workoutDetails : MyWorkout!
    
    var dataSource : DetailsDataSource!
    var delegate : DetailsDelegate!

    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var detailsTV: UITableView!
    @IBOutlet weak var workoutDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = DetailsDataSource()
        delegate = DetailsDelegate()
        
        dataSource.exercises = workoutDetails.exercises
        detailsTV.dataSource = dataSource
        detailsTV.delegate = delegate
        
        fillFields()
    }
    
    private func fillFields() {
        
        workoutName.text = workoutDetails.name
        workoutDate.text = workoutDetails.date
    }
}
