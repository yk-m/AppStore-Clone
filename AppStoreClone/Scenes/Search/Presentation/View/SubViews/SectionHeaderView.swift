//
//  SectionHeaderView.swift
//  AppStoreClone
//
//  Created by SCI01725 on 2019/12/20.
//  Copyright © 2019 Yuka Matsuo. All rights reserved.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    public func set(title: String) {
        titleLabel.text = title
    }
}
