//
//  WorkoutSessionCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSessionCollectionViewCell: NRCollectionViewCell {
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private lazy var scrollContentView: UIView = .init()

    private lazy var nameLabel: NRLabel = {
        let label = NRLabel()
        label.textAlignment = .center
        return label
    }()

    private var exercise: Exercise?

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func setup(with exercise: Exercise) {
        self.exercise = exercise

        setupView()
        setupContent()
    }

    private func setupView() {
        contentView.addSubview(scrollView)
        scrollView.fillSuperview()

        scrollView.addSubview(scrollContentView)
        scrollContentView.fillSuperview()
        scrollContentView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        scrollContentView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true

        [nameLabel].forEach(scrollContentView.addSubview)

        nameLabel.anchor(top: scrollContentView.topAnchor,
                         leading: scrollContentView.leadingAnchor,
                         trailing: scrollContentView.trailingAnchor,
                         padding: .init(top: NRStyle.verticalPadding, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding))
    }

    private func setupContent() {
        nameLabel.text = exercise?.name
    }
}
