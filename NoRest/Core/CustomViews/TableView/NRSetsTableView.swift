//
//  NRSetsTableView.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRSetsTableView: UITableView {
    var maxHeight: CGFloat = NRConstants.TableViews.rowHeight * 2
    
    convenience init(maxHeight: CGFloat) {
        self.init()
        self.maxHeight = maxHeight
        setupDesign()
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let contentHeight = contentSize.height + contentInset.top
        let height = min(contentHeight, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
    
    private func setupDesign() {
        separatorColor = .uiControl
        separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.uiControl.cgColor
    }
}
