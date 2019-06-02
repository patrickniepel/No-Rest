//
//  CurrentWorkoutViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .backgroundColorMain
        cv.isPagingEnabled = true
        cv.isScrollEnabled = true
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CurrentWorkoutCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.currentWorkoutCollectionViewCell)
        
        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        return cv
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .backgroundColorUIControl
        pageControl.currentPageIndicatorTintColor = .uiControl
        pageControl.backgroundColor = .backgroundColorMain
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    var myWorkout: MyWorkout?
    var currentPage: Int = 0
    private let workoutCtrl = MyWorkoutController()
    private var dataSource: CurrentWorkoutCollectionViewDataSource?
    private var delegate: CurrentWorkoutCollectionViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        subscribe()
        view.backgroundColor = .backgroundColorMain
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
        hideKeyboardWhenTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveWorkout()
    }
    
    func setup() {
        setupLayout()
        setupPageControl()
        setupCollectionView()
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = myWorkout?.exercises.count ?? 0
    }
    
    private func setupCollectionView() {
        dataSource = CurrentWorkoutCollectionViewDataSource(exercises: myWorkout?.exercises ?? [])
        delegate = CurrentWorkoutCollectionViewDelegate()
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func updateView() {
        //Reload workout from user data
        myWorkout = workoutCtrl.loadWorkout(with: myWorkout?.id)
        guard let workout = myWorkout else { return }
        
        //If there are no exercises left, pop view controller
        if workout.exercises.count == 0 {
            navigationController?.popViewController(animated: true)
        }
        
        //Scroll to last 'visited' exercise
        let pageIndex = currentPage < workout.exercises.count ? currentPage : workout.exercises.count - 1
        let indexPath = IndexPath(item: pageIndex, section: 0)
        
        dataSource?.exercises = workout.exercises
        pageControl.numberOfPages = workout.exercises.count
        
        collectionView.reloadData()
        updatePage(page: currentPage)
        
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }

    func updatePage(page: Int) {
        pageControl.currentPage = page
        currentPage = page
        navigationItem.title = myWorkout?.exercises[safe: page]?.name ?? NRConstants.ScreenTitles.currentWorkout
    }
    
    private func saveWorkout(toHistory: Bool = false) {
        guard var workout = myWorkout, let dataSource = dataSource else { return }
        workout.exercises = dataSource.exercises
        workout.date = Date()
        workoutCtrl.saveWorkout(workout)
        
        if toHistory {
            workoutCtrl.addWorkoutToHistory(workout)
        }
    }
    
    @objc private func handleDoneButton() {
        saveWorkout(toHistory: true)
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        unsubscribe()
    }
}

extension CurrentWorkoutViewController {
    
    private func setupLayout() {
        view.addSubviews(pageControl, collectionView)
        
        pageControl.anchor(bottom: view.bottomAnchor, centerX: view.centerXAnchor)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: pageControl.topAnchor, trailing: view.trailingAnchor)
    }
}
