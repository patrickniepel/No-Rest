//
//  SetsTableView.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SetsTableView: UITableView {
    var maxHeight: CGFloat = 300
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let contentHeight: CGFloat = CGFloat(self.visibleCells.count) * NRConstants.TableViews.rowHeight * 0.75
        let height = min(contentHeight, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupDesign()
    }
    
    private func setupDesign() {
        separatorColor = .uiControl
        separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.uiControl.cgColor
    }
}
