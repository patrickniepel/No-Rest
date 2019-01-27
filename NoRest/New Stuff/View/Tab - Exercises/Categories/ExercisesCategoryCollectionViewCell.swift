//
//  ExercisesCategoryCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryCollectionViewCell: UICollectionViewCell {
    
    private var categoryTitle: String?
    
    lazy var categoryButton: NRButton = {
        let button = NRButton()
        button.setTitle(categoryTitle, for: .normal)
        button.setTitleColor(.mainColor, for: .normal)
        button.addTarget(self, action: #selector(categoryTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell(with title: String) {
        categoryTitle = title
        
        addSubview(categoryButton)
        categoryButton.fillSuperview()
        
        setupDesign()
    }

    private func setupDesign() {
        contentView.backgroundColor = superview?.backgroundColor
    }
    
    @objc private func categoryTapped(sender: UIButton) {
        if let categoryString = sender.titleLabel?.text,
            let category = DefaultCategory(rawValue: categoryString) {
            
            let selectedCategoryAction = SelectedCategoryAction(category: category)
            store.dispatch(selectedCategoryAction)
            
            let routeAction = RouteAction(screen: .exercisesForCategory, in: .exercises)
            store.dispatch(routeAction)
        }
    }
}
