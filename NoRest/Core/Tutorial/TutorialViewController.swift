//
//  TutorialViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class TutorialViewController: NRViewController {
    private lazy var tutorialView: TutorialView = .init(showFinishButton: self.showSkipButton)
    private let showSkipButton: Bool
    
    init(showSkipButton: Bool = false) {
        self.showSkipButton = showSkipButton
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(tutorialView)
        tutorialView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        guard showSkipButton else { return }
        
        let skipButton = UIBarButtonItem(title: "button.title.skip".localized, style: .done, target: tutorialView, action: #selector(tutorialView.finishTutorial))
        navigationItem.rightBarButtonItem = skipButton
    }
}
