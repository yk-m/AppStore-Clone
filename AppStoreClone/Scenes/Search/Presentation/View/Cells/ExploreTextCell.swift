//
//  ExploreCell.swift
//  AppStoreClone
//
//  Created by yuka on 2020/01/18.
//  Copyright © 2020 Yuka Matsuo. All rights reserved.
//

import UIKit

class ExploreTextCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var topBorder: UIView!
    
    public func set(title: String) {
        titleLabel.text = title
    }
    
    public func hideBorder() {
        topBorder.isHidden = true
    }
}
