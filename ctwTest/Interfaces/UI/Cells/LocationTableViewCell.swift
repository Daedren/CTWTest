//
//  LocationTableViewCell.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import UIKit

class LocationTableViewCell: UITableViewCell, BaseViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    func configure(from model: LocationTableViewCellModel) {
        self.mainLabel.text = model.main
        self.subLabel.text = model.sub
        self.captionLabel.text = model.caption
    }
}
