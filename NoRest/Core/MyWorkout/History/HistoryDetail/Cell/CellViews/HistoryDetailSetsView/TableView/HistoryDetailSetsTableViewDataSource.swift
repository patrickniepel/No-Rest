//
//  HistoryDetailSetsTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension HistoryDetailSetsView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.nrSetsTableViewCell, for: indexPath) as? NRSetsTableViewCell
        
        if let set = sets[safe: indexPath.row] {
            cell?.setup(with: set)
            cell?.disableUserInteraction()
        }
        
        return cell ?? UITableViewCell()
    }
}
