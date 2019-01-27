//
//  ExercisesCategoryDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let padding: CGFloat = NRConstants.Padding.collectionViewItem
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 2 - padding * 1.5
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
