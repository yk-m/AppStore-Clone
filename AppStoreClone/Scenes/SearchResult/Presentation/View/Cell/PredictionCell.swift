//
//  PredictionCell.swift
//  AppStoreClone
//
//  Created by yuka on 2020/01/18.
//  Copyright © 2020 Yuka Matsuo. All rights reserved.
//

import UIKit

class PredictionCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    public func set(title: String) {
        titleLabel.text = title
    }
}
