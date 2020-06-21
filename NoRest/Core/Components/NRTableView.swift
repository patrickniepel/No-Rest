//
//  NRTableView.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.03.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRTableView: UITableView {
    override init(frame: CGRect = CGRect(), style: UITableView.Style = .plain) {
        super.init(frame: frame, style: style)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        separatorInset = UIEdgeInsets(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding)
        separatorColor = NRStyle.secondaryTextColor
        backgroundColor = NRStyle.themeColor
    }
}
