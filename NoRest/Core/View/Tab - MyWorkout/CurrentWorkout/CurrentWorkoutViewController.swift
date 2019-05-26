//
//  CurrentWorkoutViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
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
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
        updatePage(page: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        handleDoneButton()
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
    
    private func updateCollectionView() {
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
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        collectionView.reloadData()
    }

    func updatePage(page: Int) {
        pageControl.currentPage = page
        currentPage = page
        navigationItem.title = myWorkout?.exercises[safe: page]?.name ?? NRConstants.ScreenTitles.currentWorkout
    }
    
    @objc private func handleDoneButton() {
        //Save workout
        guard let workout = myWorkout, let dataSource = dataSource else { return }
        workout.exercises = dataSource.exercises
        workoutCtrl.saveWorkout(workout)
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
