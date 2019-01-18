//
//  RearrangingTableViewCell.swift
//  Push
//
//  Created by Patrick Niepel on 15.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class RearrangingTableViewCell: UITableViewCell {

    @IBOutlet weak var workoutName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
