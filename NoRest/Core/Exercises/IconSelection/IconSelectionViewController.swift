//
//  IconSelectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class IconSelectionViewController: UIViewController {
    private lazy var iconSelectionView: IconSelectionView = .init()
    private var tapGestureRecognizer: UITapGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGestureRecognizer()
    }

    private func setupView() {
        view.addSubview(iconSelectionView)

        let width = UIScreen.main.bounds.width / 2
        let height = CustomIcons.allIcons().count > 9 ? width + NRStyle.verticalPadding : width
        iconSelectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                 centerX: view.centerXAnchor,
                                 padding: .init(top: NRStyle.verticalPadding * 2, left: 0, bottom: 0, right: 0),
                                 size: .init(width: width, height: height))

        view.backgroundColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.7)
    }

    // swiftlint:disable force_unwrapping
    private func setupGestureRecognizer() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleViewTapped))
        tapGestureRecognizer?.delegate = self
        view.addGestureRecognizer(tapGestureRecognizer!)
    }

    @objc
    private func handleViewTapped() {
        dismissIconSelection()
    }

    func dismissIconSelection() {
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        guard let tapGestureRecognizer = tapGestureRecognizer else { return }
        view.removeGestureRecognizer(tapGestureRecognizer)
    }
}

extension IconSelectionViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == view
    }
}
