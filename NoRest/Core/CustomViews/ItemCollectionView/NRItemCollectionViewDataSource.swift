//
//  NRItemCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRItemCollectionViewDataSource<T>: NSObject, UICollectionViewDataSource {

    var items: [T] = []
    
    init(items: [T]) {
        self.items = items
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.itemCollectionViewCell, for: indexPath) as? NRItemCollectionViewCell
        if let currentItem = items[safe: indexPath.item] {
            cell?.setup(item: currentItem)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func deleteItem(at index: Int) {
        items.remove(at: index)
    }
}
