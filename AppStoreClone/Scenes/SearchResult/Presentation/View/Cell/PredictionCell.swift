//
//  PredictionCell.swift
//  AppStoreClone
//
//  Created by yuka on 2020/01/18.
//  Copyright © 2020 Yuka Matsuo. All rights reserved.
//

import UIKit

class PredictionCell: UITableViewCell {
        
    @IBOutlet private weak var keywordLabel: UILabel!
    
    public func set(keyword: String) {
        keywordLabel.text = keyword
    }
}
