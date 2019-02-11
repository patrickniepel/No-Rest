//
//  NRButton.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

enum NRButtonStyle {
    case normal
    case destructive
}

class NRButton: UIButton {
    
    private var title: String?
    private var style: NRButtonStyle?

    init(frame: CGRect = CGRect(), with title: String?, style: NRButtonStyle) {
        super.init(frame: frame)
        self.title = title
        self.style = style
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        layer.cornerRadius = 25
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 10
        layer.masksToBounds = false
        
        if style == .normal {
            setupNormal()
        } else if style == .destructive {
            setupDestructive()
        }
    }
    
    private func setupNormal() {
        backgroundColor = .white
        let attributedString = NSAttributedString.init(string: title ?? "", attributes: [.font: UIFont(name: NRConstants.Text.font, size: .fontSizeLarge) as Any, .foregroundColor: UIColor.textColor as Any])
        setAttributedTitle(attributedString, for: .normal)
        layer.shadowColor = UIColor.mainColor.cgColor
    }
    
    private func setupDestructive() {
        backgroundColor = .danger
        let attributedString = NSAttributedString.init(string: title ?? "", attributes: [.font: UIFont(name: NRConstants.Text.fontBold, size: .fontSizeRegular) as Any, .foregroundColor: UIColor.textColorLight as Any])
        setAttributedTitle(attributedString, for: .normal)
        layer.shadowColor = backgroundColor?.cgColor
    }

}
