//
//  ExercisesCategoryCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryCollectionViewCell: UICollectionViewCell {

    private let categoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundColorUIControl
        
        return button
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryButton.setAttributedTitle(nil, for: .normal)
    }
    
    func setupCell(with title: String) {
        let attributedString = NSAttributedString(string: title, attributes: [.font: UIFont(name: NRConstants.Font.fontBold, size: .fontSizeLarge) as Any, .foregroundColor: UIColor.textColor as Any])
        categoryButton.setAttributedTitle(attributedString, for: .normal)
        categoryButton.addTarget(self, action: #selector(categoryTapped), for: .touchUpInside)
        
        contentView.addSubview(categoryButton)
        categoryButton.fillSuperview()
        
        setupDesign()
    }

    private func setupDesign() {
        contentView.backgroundColor = superview?.backgroundColor
        contentView.layer.cornerRadius = 25
        contentView.clipsToBounds = true
        applyShadow()
    }
    
    @objc private func categoryTapped(sender: UIButton) {
        if let categoryString = sender.titleLabel?.text,
            let category = Category(rawValue: categoryString) {
            
            let selectedCategoryAction = SelectedCategoryAction(category: category)
            store.dispatch(selectedCategoryAction)
            
            let routeAction = RouteAction(screen: .exercisesForCategory, in: .exercises)
            store.dispatch(routeAction)
        }
    }
}
