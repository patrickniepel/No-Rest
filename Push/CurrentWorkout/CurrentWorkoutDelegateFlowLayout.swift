//
//  CurrentWorkoutDelegateFlowLayout.swift
//  Push
//
//  Created by Patrick Niepel on 19.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutDelegateFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
}
