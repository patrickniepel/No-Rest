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
        let width = collectionView.frame.width - padding * 2
        let height = collectionView.frame.height - padding * 2 - 88
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding * 2
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for child in scrollView.window?.rootViewController?.children ?? [] {
            if let vc = (child as? UINavigationController)?.topViewController as? MainStatisticsViewController,
                let collectionView = scrollView as? UICollectionView,
                let cell = collectionView.visibleCells.first,
                let indexPath = collectionView.indexPath(for: cell) {
                
                vc.updatePageControl(page: indexPath.item)
            }
        }
    }
}
