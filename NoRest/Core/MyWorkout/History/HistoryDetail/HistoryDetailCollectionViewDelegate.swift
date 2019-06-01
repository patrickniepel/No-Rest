//
//  HistoryDetailCollectionViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension HistoryDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width - 64
        let height = collectionView.bounds.height - 40
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 32, bottom: 32, right: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 64
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let vc = scrollView.presentingViewController as? HistoryDetailViewController,
            let cell = vc.collectionView.visibleCells.first,
            let indexPath = vc.collectionView.indexPath(for: cell) {
            
            vc.updatePageControl(page: indexPath.item)
        }
    }
}
