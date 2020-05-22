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
    
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
    
    func setupDesign() {
        separatorColor = NRStyle.complementaryColor
        separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = NRStyle.complementaryColor.cgColor
    }
}
