//
//  MainStatisticsCollectionViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class MainStatisticsCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    private let padding: CGFloat = NRConstants.Padding.collectionViewItem
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let vc = scrollView.presentingViewController as? MainStatisticsViewController,
            let cell = vc.mainStatisticsCollectionView.visibleCells.first,
            let indexPath = vc.mainStatisticsCollectionView.indexPath(for: cell) {
            
            vc.updatePageControl(page: indexPath.item)
        }
    }
}
