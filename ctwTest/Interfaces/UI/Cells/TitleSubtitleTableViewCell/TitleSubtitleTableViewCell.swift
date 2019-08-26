//
//  TitleSubtitleTableViewCell.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import UIKit

class TitleSubtitleTableViewCell: UITableViewCell, BaseViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func configure(from model: TitleSubtitleTableViewCellModel) {
        self.bodyLabel.text = model.body
        self.titleLabel.text = model.title
        
    }
}
