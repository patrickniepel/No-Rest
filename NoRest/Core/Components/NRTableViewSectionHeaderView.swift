//
//  NRTableViewSectionHeaderView.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRTableViewSectionHeaderView: UIView {
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
        backgroundColor = NRStyle.complementaryColor

        let titleLabel = NRLabelDark(with: title, size: NRStyle.fontSizeLarge)
        titleLabel.textColor = NRStyle.themeColor

        addSubview(titleLabel)
        titleLabel.fillSuperview(padding: .init(top: 0, left: NRStyle.horizontalPadding / 2, bottom: 0, right: 0))
    }
}
