//
//  WorkoutSettingViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSettingViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = NRConstants.TableViews.rowHeight
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = true
        tableView.setupDefaultBackgroundColor()
        return tableView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontSizeToFitWidth = true
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .default
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: NRConstants.Text.font, size: .fontSizeRegular)
        textField.keyboardAppearance = .default
        textField.keyboardType = .default
        return textField
    }()
    
    private var dataSource: WorkoutSettingTableViewDataSource?
    private var delegate: WorkoutSettingTableViewDelegate?
    var workout: MyWorkout?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select {
                $0.workoutSettingState
            }
        }

        dataSource = WorkoutSettingTableViewDataSource()
        delegate = WorkoutSettingTableViewDelegate()
        
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(NRDefaultTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.workoutSettingTableViewCell)
        
        view.setupDefaultBackgroundColor()
        setupLayout()
    }
    
    private func setupNavigationBar() {
        let sortingButton = UIBarButtonItem(title: NRConstants.BarButtonItemTitles.sortingButton, style: .plain, target: self, action: #selector(openSortingScreen))
        navigationItem.rightBarButtonItem = sortingButton
    }
    
    private func fillLayout() {
        guard let workout = workout else { return }
        nameTextField.text = workout.name
        //table view setup
    }
    
    func setupWorkout(_ workout: MyWorkout?) {
        if let workout = workout {
            self.workout = workout
        } else {
            self.workout = MyWorkout(name: "", exercises: [])
        }
        navigationItem.title = workout?.name ?? NRConstants.ScreenTitles.newWorkout
    }
    
    @objc private func openSortingScreen() {
        
    }
    
    deinit {
        store.unsubscribe(self)
    }
}

// Layout
extension WorkoutSettingViewController {
    
    private func setupLayout() {
        view.addSubview(nameTextField)
        view.addSubview(tableView)
        nameTextField.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: .defaultPadding, left: .defaultPadding, bottom: 0, right: .defaultPadding))
        
        let bottomAnchor: NSLayoutYAxisAnchor?
        if #available(iOS 11.0, *) {
            bottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
        } else {
            bottomAnchor = view.bottomAnchor
        }
        tableView.anchor(top: nameTextField.bottomAnchor, leading: view.leadingAnchor, bottom: bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: .defaultPadding, left: 0, bottom: 0, right: 0))
    }
}

