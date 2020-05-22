//
//  CurrentWorkoutViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit
import SCLAlertView

class CurrentWorkoutViewController: UIViewController {
    
    let collectionView: CurrentWorkoutCollectionView = {
        let cv = CurrentWorkoutCollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = NRStyle.themeColor
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
        pageControl.pageIndicatorTintColor = NRStyle.themeColor
        pageControl.currentPageIndicatorTintColor = NRStyle.complementaryColor
        pageControl.backgroundColor = NRStyle.themeColor
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    var workout: Workout?
    var currentPage: Int = 0
    private var saveDataIfClosed = true
    private let workoutsCtrl = WorkoutsController()

    override func viewDidLoad() {
        super.viewDidLoad()

        subscribe()
        setupScreen()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if saveDataIfClosed {
            saveWorkout()
        }
    }
    
    private func setupScreen() {
        view.backgroundColor = NRStyle.themeColor
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(handleUndoButton))
        hideKeyboardWhenTapped()
    }
    
    func setup() {
        setupLayout()
        setupPageControl()
        setupCollectionView()
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = workout?.exercises.count ?? 0
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func updateView() {
        //Reload workout from user data
        workout = workoutsCtrl.loadWorkout(with: -1)
        guard let workout = workout else { return }
        
        //If there are no exercises left, pop view controller
        if workout.exercises.count == 0 {
            navigationController?.popViewController(animated: true)
        }
        
        //Scroll to last 'visited' exercise
        let pageIndex = currentPage < workout.exercises.count ? currentPage : workout.exercises.count - 1
        let indexPath = IndexPath(item: pageIndex, section: 0)
        
        pageControl.numberOfPages = workout.exercises.count
        
        collectionView.reloadData()
        updatePage(page: currentPage)
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    func updatePage(page: Int) {
        pageControl.currentPage = page
        currentPage = page
        navigationItem.title = workout?.exercises[safe: page]?.name ?? NRConstants.ScreenTitles.currentWorkout
    }
    
    private func saveWorkout(toHistory: Bool = false) {
        guard var workout = workout else { return }
    }
    
    @objc private func handleDoneButton() {
        saveWorkout(toHistory: true)
        AlertController.showSuccessAlert(with: NRConstants.Alerts.workoutFinished)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleUndoButton() {
        let appearance = AlertController.interactiveAlertAppearance()
        
        let alertView = SCLAlertView(appearance: appearance)
        let responder = SCLAlertViewResponder(alertview: alertView)
        alertView.addButton(NRConstants.ButtonTitles.undo) { [weak self] in
            self?.saveDataIfClosed = false
            self?.navigationController?.popViewController(animated: true)
        }
        alertView.addButton(NRConstants.ButtonTitles.cancel) {
            responder.close()
        }
        alertView.showWarning(NRConstants.Alerts.alertMessage, subTitle: NRConstants.Alerts.losingData, animationStyle: .bottomToTop)
    }
    
    deinit {
        unsubscribe()
    }
}

private extension CurrentWorkoutViewController {
    
    func setupLayout() {
        view.addSubviews(pageControl, collectionView)
        
        pageControl.anchor(bottom: view.bottomAnchor, centerX: view.centerXAnchor)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: pageControl.topAnchor, trailing: view.trailingAnchor)
    }
}

class CurrentWorkoutCollectionView: UICollectionView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        //Disable collection view scrolling for enabling table view cell deletion
        let result = super.hitTest(point, with: event)
        if let scrollingEnabled = result?.superview?.isKind(of: NRSetsTableViewCell.self) {
            self.isScrollEnabled = !scrollingEnabled
        } else {
            self.isScrollEnabled = true
        }
        return result
    }
}
