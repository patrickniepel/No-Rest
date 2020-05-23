//
//  ExercisesViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesViewController: NRViewController {
    private lazy var searchBar: NRSearchBar = .init()
    private lazy var tableView: NRTableView = .init()
    
    private let exercisesCtrl: ExercisesController
    
    init() {
        exercisesCtrl = ExercisesController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        viewControllerTitle = "exercises.title".localized
        super.viewDidLoad()
        
        setupAddButton()
        setupView()
        setupTableView()
    }
    
    private func setupAddButton() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewExercise))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    private func setupView() {
        [searchBar, tableView].forEach(view.addSubview)
        
        searchBar.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))
        
        tableView.anchor(top: searchBar.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: 0, bottom: 0, right: 0))
        
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
    }
    
    @objc
    private func addNewExercise() {
        let editExerciseAction = EditExerciseAction(exercise: nil)
        store.dispatch(editExerciseAction)
        
        let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
        store.dispatch(routeAction)
    }
}

extension ExercisesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return exercisesCtrl.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesCtrl.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.reuseIdentifier, for: indexPath) as! ExerciseTableViewCell
        
        if let exercise = exercisesCtrl.exercise(for: indexPath) {
            cell.setup(with: exercise)
        }
        
        return cell
    }
}

extension ExercisesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let exercise = exercisesCtrl.exercise(for: indexPath) else { return }
        
        let editExerciseAction = EditExerciseAction(exercise: exercise)
        store.dispatch(editExerciseAction)
        
        let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
        store.dispatch(routeAction)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = ExerciseType.allCases[section].rawValue
        let headerView = NRTableViewSectionHeaderView(title: sectionTitle)
        return headerView
    }
}

extension ExercisesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(with: searchBar.text ?? "")
    }
    
    private func search(with searchText: String) {
        guard !searchText.isBlank, let indexPath = exercisesCtrl.searchResult(for: searchText) else { return }
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
