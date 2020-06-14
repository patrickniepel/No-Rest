//
//  TutorialController.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

struct TutorialController {
    let tutorialPages: [TutorialPage]
    
    init() {
        tutorialPages = [
            TutorialPage(title: "tutorial.page1.title".localized, image: NRStyle.exercisesIcon, text: "tutorial.page1.text".localized),
            TutorialPage(title: "tutorial.page2.title".localized, image: NRStyle.exercisesIcon, text: "tutorial.page2.text".localized),
            TutorialPage(title: "tutorial.page3.title".localized, image: NRStyle.exercisesIcon, text: "tutorial.page3.text".localized),
            TutorialPage(title: "tutorial.page4.title".localized, image: NRStyle.exercisesIcon, text: "tutorial.page4.text".localized),
            TutorialPage(title: "tutorial.page5.title".localized, image: NRStyle.exercisesIcon, text: "tutorial.page5.text".localized)
        ]
    }
    func numberOfTutorialPages() -> Int {
        tutorialPages.count
    }
    
    func tutorialPage(for index: Int) -> TutorialPage {
        tutorialPages[index]
    }
}
