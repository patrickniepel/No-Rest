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
}
