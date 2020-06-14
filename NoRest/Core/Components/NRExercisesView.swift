//
//  NRExercisesView.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRExercisesView: UIView {
    lazy var tableView: NRTableView = .init()
    
    lazy var searchBar: NRSearchBar = {
        let searchBar = NRSearchBar()
        searchBar.placeholder = "exercise.search".localized
        searchBar.delegate = self
        return searchBar
    }()
    
    let exercisesCtrl: ExercisesController
    
    private var lastContentOffset: CGFloat = 0
    private var searchBarTopConstraint: NSLayoutConstraint?
    private var didEndEditing = true
    
    override init(frame: CGRect = CGRect()) {
        exercisesCtrl = ExercisesController()
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        [searchBar, tableView].forEach(addSubview)
        
        searchBarTopConstraint = NSLayoutConstraint.init(item: searchBar, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        searchBarTopConstraint?.isActive = true
        searchBar.anchor(leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: NRStyle.horizontalPadding / 2, bottom: 0, right: NRStyle.horizontalPadding / 2))
        
        tableView.anchor(top: searchBar.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        
        // Maybe a bug in uikit
        // Table view content offset jumps a bit after reloadData has been called
        // https://stackoverflow.com/questions/47123404/uitableview-scroll-glitch-for-ios-11-content-offset-jump-caused-by-reloaddata-t
        tableView.estimatedRowHeight = 75
    }
}

extension NRExercisesView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return exercisesCtrl.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesCtrl.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension NRExercisesView: UITableViewDelegate {
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
}

extension NRExercisesView: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        didEndEditing = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        didEndEditing = true
    }
    
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

extension NRExercisesView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Hide searchBar when scrolling down
        let bottomOffset = scrollView.contentSize.height - scrollView.bounds.height

        guard scrollView.contentOffset.y < bottomOffset, let topConstraint = searchBarTopConstraint, didEndEditing else {
            return
        }

        guard scrollView.contentOffset.y > 0 else {
            topConstraint.constant = 0
            return
        }

        let offsetDiff = scrollView.contentOffset.y - lastContentOffset

        let newConstant = topConstraint.constant + (offsetDiff > 0 ? -abs(offsetDiff) : abs(offsetDiff))
        let minConstant = -searchBar.frame.height

        topConstraint.constant = max(minConstant, min(0, newConstant))

        self.lastContentOffset = scrollView.contentOffset.y
    }
}
