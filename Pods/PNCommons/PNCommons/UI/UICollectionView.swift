//
//  UICollectionView.swift
//  PNCommons
//
//  Created by Patrick Niepel on 05.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UICollectionView {
    
    /**
     Registers one or more UICollectionViewCells
     - parameter cellClasses: The cell classes to register
     */
    func registerCells<T: UICollectionViewCell>(cellClasses: T.Type...) {
        cellClasses.forEach { register($0, forCellWithReuseIdentifier: $0.className) }
    }
}
