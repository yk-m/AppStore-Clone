//
//  AppCell.swift
//  AppStoreClone
//
//  Created by yuka on 2020/01/18.
//  Copyright © 2020 Yuka Matsuo. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {
    
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private var starImages: [UIImageView]!
    @IBOutlet private weak var ratingCountLabel: UILabel!
    @IBOutlet private weak var installButton: UIButton! {
        didSet {
            installButton.backgroundColor = .secondarySystemBackground
        }
    }
    @IBOutlet private weak var descriptionImage: UIImageView!
    
    public func set(app: StoreApp) {
        titleLabel.text = app.title
        descriptionLabel.text = app.description
        ratingCountLabel.text = app.ratingCount
        iconImage.image = app.iconImage
        descriptionImage.image = app.descriptionImage
        set(rating: app.rating)
    }
    
    private func set(rating: Double) {
        for (index, starImage) in zip(starImages.indices, starImages) {
            let count = Double(index) + 1.0
            if (rating < count) {
                if (rating < count - 0.5) {
                    starImage.image = UIImage.init(systemName: "star")
                } else {
                    starImage.image = UIImage.init(systemName: "star.lefthalf.fill")
                }
            } else {
                starImage.image = UIImage.init(systemName: "star.fill")
            }
        }
    }
}
