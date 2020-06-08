//
//  ExercisesView.swift
//  NoRest
//
//  Created by Patrick Niepel on 05.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesView: UIView {
    lazy var tableView: NRTableView = .init()
    
    private lazy var searchBar: NRSearchBar = {
        let searchBar = NRSearchBar()
        searchBar.placeholder = "exercise.search".localized
        return searchBar
    }()
    
    private let exercisesCtrl: ExercisesController
    
    override init(frame: CGRect = CGRect()) {
        exercisesCtrl = ExercisesController()
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        [searchBar, tableView].forEach(addSubview)
        
        searchBar.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))
        
        tableView.anchor(top: searchBar.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: NRStyle.verticalPadding, left: 0, bottom: 0, right: 0))
        
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
    }
    
    private func openEditScreen(with exercise: Exercise) {
        let editExerciseAction = EditExerciseAction(exercise: exercise)
        store.dispatch(editExerciseAction)
        
        let routeAction = RouteAction(screen: .editExercise, in: .exercises, action: .push)
        store.dispatch(routeAction)
    }
    
    @objc
    func addNewExercise() {
        openEditScreen(with: exercisesCtrl.generateNewExercise())
    }
    
    func reloadTableViewContent() {
        exercisesCtrl.updateExercises()
        tableView.reloadData()
    }
}

extension ExercisesView: UITableViewDataSource {
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

extension ExercisesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let exercise = exercisesCtrl.exercise(for: indexPath) else { return }
        
        openEditScreen(with: exercise)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = ExerciseType.allCases[section].displayName
        let headerView = NRTableViewSectionHeaderView(title: sectionTitle)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, success: (Bool) -> Void) in
            self?.exercisesCtrl.deleteExercise(for: indexPath)
            self?.exercisesCtrl.updateExercises()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            success(true)
        }

        deleteAction.image = NRStyle.binIcon?.dye(.white)
        deleteAction.backgroundColor = NRStyle.warningColor

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension ExercisesView: UISearchBarDelegate {
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
