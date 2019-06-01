//
//  HistoryDetailSetsTableViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension HistoryDetailSetsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NRConstants.TableViews.rowHeight * 0.75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return NRConstants.TableViews.rowHeight * 0.75 / 2
    }
}
