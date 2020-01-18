//
//  HeaderCell.swift
//  AppStoreClone
//
//  Created by yuka on 2020/01/18.
//  Copyright © 2020 Yuka Matsuo. All rights reserved.
//

import UIKit

class ExploreHeaderCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    public func set(title: String) {
        titleLabel.text = title
    }
}
