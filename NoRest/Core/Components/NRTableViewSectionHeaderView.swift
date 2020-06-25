//
//  NRTableViewSectionHeaderView.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRTableViewSectionHeaderView: UIView, Themeable {
    typealias Theme = TableViewSectionHeaderViewTheme

    private lazy var titleLabel: UILabel = .init()

    private let title: String

    init(frame: CGRect = CGRect(), title: String) {
        self.title = title
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.native.tableViewSectionHeaderViewTheme)

        addSubview(titleLabel)
        titleLabel.fillSuperview(padding: .init(top: 0, left: NRStyle.horizontalPadding / 2, bottom: 0, right: 0))
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor

        titleLabel.textColor = theme.textColor
        titleLabel.font = theme.textFont
    }
}
