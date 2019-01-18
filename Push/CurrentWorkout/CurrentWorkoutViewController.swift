//
//  CurrentWorkoutViewController.swift
//  Push
//
//  Created by Patrick Niepel on 19.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

enum WorkoutState {
    case new
    case old
}

class CurrentWorkoutViewController: UIViewController, NotesExplanationSegueDelegate, TimerSegueDelegate {
    
    var dataSource : CurrentWorkoutDataSource!
    var delegate : CurrentWorkoutDelegateFlowLayout!
    var currentWorkout : MyWorkout!
    var newWorkoutInstance : MyWorkout = MyWorkout()
    var currentWorkoutCtrl : CurrentWorkoutController!
    lazy var settingsCtrl = SettingsController()
    
    var workoutState : WorkoutState = .new

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var userData = UserData.sharedInstance
    
    var currentPage = 0
    var totalPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWorkoutCtrl = CurrentWorkoutController()
        
        dataSource = CurrentWorkoutDataSource()
        delegate = CurrentWorkoutDelegateFlowLayout()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        
        dataSource.exercises = currentWorkout.exercises
        
        totalPages = currentWorkout.exercises.count
        
        setupLayout()
        checkPage()
        checkButtonForPaging()
        hideKeyboardWhenTapped()
        
        setupWorkoutDate()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(saveWorkout), name: NSNotification.Name("saveWorkout"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        guard let cell = collectionView.visibleCells[0] as? CurrentWorkoutCardioCollectionViewCell else { return }
        cell.stopTimer()
    }
    
    private func setupLayout() {
        prevButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 10
        pageControl.numberOfPages = currentWorkout.exercises.count
    }
    
    private func checkButtonForPaging() {
        
        if currentPage == 0 {
            prevButton.layer.opacity = 0
            prevButton.isEnabled = false
        }
        else {
            prevButton.layer.opacity = 1
            prevButton.isEnabled = true
        }
        if currentPage == currentWorkout.exercises.count - 1 {
            nextButton.layer.opacity = 0
            nextButton.isEnabled = false
        }
        else {
            nextButton.layer.opacity = 1
            nextButton.isEnabled = true
        }
        if dataSource.exercises[currentPage].category == "Cardio" {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            self.navigationItem.rightBarButtonItem?.tintColor = .gray
        }
        else {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            self.navigationItem.rightBarButtonItem?.tintColor = .myBlue
        }
    }
    
    private func checkPage() {
        pageControl.currentPage = currentPage
        self.navigationItem.title = currentWorkout.exercises[currentPage].name
    }
    
    private func setupWorkoutDate() {
        let today = currentWorkoutCtrl.getCurrentDate()
        currentWorkout.date = today
    }
    
    private func layoutCellAgain() {
        guard let cell = collectionView.visibleCells[0] as? CurrentWorkoutCollectionViewCell else { return }
        cell.changePage(page: currentPage)
    }
    
    @objc func saveWorkout(notification: NSNotification) {
        
        updateNewInstance()

        if workoutState == .new {
            UserData.sharedInstance.workoutHistory.workouts.append(newWorkoutInstance)
            UserData.sharedInstance.statistics.statisticsData.append(newWorkoutInstance)
        }
        if workoutState == .old {
            var historyWorkouts = userData.workoutHistory.workouts
            var statisticWorkouts = userData.statistics.statisticsData
            
            //The last one that gets removed, is the current workout that was added after saving it the first time
            historyWorkouts.removeLast()
            historyWorkouts.append(newWorkoutInstance)
            
            //let statisticIndex = statisticWorkouts.index(of: statisticWorkouts.last!)
            statisticWorkouts.removeLast()
            statisticWorkouts.append(newWorkoutInstance)
        }
        workoutState = .old
    }
    
    private func updateNewInstance() {
        newWorkoutInstance.date = currentWorkout.date
        newWorkoutInstance.name = currentWorkout.name
        newWorkoutInstance.exercises = currentWorkoutCtrl.createNewExerciseArrayObject(old: currentWorkout.exercises)
    }

    @IBAction func prevPage(_ sender: UIButton) {
        currentPage -= 1
        
        if currentPage == -1 {
            currentPage = totalPages - 1
        }
        
        checkPage()
        checkButtonForPaging()
        layoutCellAgain()
        
        let prevItem: IndexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: prevItem, at: .left, animated: true)
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        currentPage += 1
        
        if currentPage == totalPages {
            currentPage = 0
        }
        
        checkPage()
        checkButtonForPaging()
        layoutCellAgain()
        
        let nextItem: IndexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: nextItem, at: .right, animated: true)
    }
    
    func backFromNotesExplanationScreen(ctrl: NotesExplanationViewController) {
        ctrl.dismiss(animated: true, completion: nil)
    }
    
    func backFromTimerScreen(ctrl: TimerViewController) {
        settingsCtrl.playTimerSoundIfActivated()
        ctrl.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "currentWorkoutVC2notesExplanationVC" {
            
            let destVC = segue.destination as! NotesExplanationViewController
            destVC.delegate = self
            destVC.currentExercise = currentWorkout.exercises[currentPage]
            //0 for notes, 1 for explanation
            let textToShow = sender as! Int
            destVC.textToShow = textToShow
        }
        
        if segue.identifier == "currentWorkoutVC2timerVC" {
            
            let destVC = segue.destination as! TimerViewController
            destVC.delegate = self
            destVC.currentExercise = currentWorkout.exercises[currentPage]
        }
    }
    
    deinit {
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: NSNotification.Name("saveWorkout"), object: nil)
    }
    
}
