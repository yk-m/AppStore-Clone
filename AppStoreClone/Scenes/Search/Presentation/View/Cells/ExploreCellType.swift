//
//  ExploreCellType.swift
//  AppStoreClone
//
//  Created by yuka on 2020/01/18.
//  Copyright © 2020 Yuka Matsuo. All rights reserved.
//

import UIKit

enum ExploreCellType {
    case header(content: String)
    case text(content: String, shouldHideBorder: Bool)
    
    var type: UITableViewCell.Type {
        switch self {
        case .header:
            return ExploreHeaderCell.self
        case .text:
            return ExploreTextCell.self
        }
    }
    
    func setUp(targetCell: UITableViewCell, indexPath: IndexPath) {
        switch self {
        case .header(let content):
            guard let cell = targetCell as? ExploreHeaderCell else {
                return
            }
            cell.set(title: content)
        case .text(let content, let shouldHideBorder):
            guard let cell = targetCell as? ExploreTextCell else {
                return
            }
            if (shouldHideBorder) {
                cell.hideBorder()
            }
            cell.set(title: content)
        }
    }
}
