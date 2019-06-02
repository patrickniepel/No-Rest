//
//  HistoryDetailCardioCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryDetailCardioView: UIView {
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 50)
        return label
    }()
    
    convenience init(timerValue: String) {
        self.init()
        
        timerLabel.text = timerValue
        
        addSubview(timerLabel)
        timerLabel.fillSuperview()
    }
}
