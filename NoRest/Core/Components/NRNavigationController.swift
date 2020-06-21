//
//  NRNavigationController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRNavigationController: UINavigationController, Themeable {
    typealias Theme = NavigationBarTheme

    override func viewDidLoad() {
        super.viewDidLoad()
        self.observe(theme: \ApplicationTheme.native.navigationBarTheme)
        setup()
    }

    private func setup() {
        interactivePopGestureRecognizer?.delegate = self
        delegate = self
    }

    func apply(theme: Theme) {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()

            appearance.backgroundColor = theme.backgroundColor
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: theme.titleColor,
                NSAttributedString.Key.font: theme.titleFont
            ]

            navigationBar.standardAppearance = appearance

            navigationBar.setNeedsLayout()
        } else {
            navigationBar.barTintColor = theme.backgroundColor
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: theme.titleColor,
                NSAttributedString.Key.font: theme.titleFont
            ]
        }

        navigationBar.tintColor = theme.tintColor
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if #available(iOS 13.0, *) {
            ThemeManager.default.theme = newCollection.userInterfaceStyle == .dark ? ApplicationTheme.dark : ApplicationTheme.light
        }
        super.willTransition(to: newCollection, with: coordinator) // You must call super somewhere. See docs.
    }
}

extension NRNavigationController: UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    /**
     Enables swipe-back gesture for all sub-ViewControllers.

     - parameter gestureRecognizer: An instance of a subclass of the abstract base class UIGestureRecognizer.
     This gesture-recognizer object is about to begin processing touches to determine if its gesture is occurring.
     - returns: true (the default) to tell the gesture recognizer to proceed with interpreting touches, false to prevent it from attempting to recognize its gesture
     */
    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
