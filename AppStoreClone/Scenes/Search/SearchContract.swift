//
//  SearchContract.swift
//  Practice
//
//  Created by Yuka Matsuo on 16/12/2018.
//  Copyright © 2018 yuka. All rights reserved.
//

import Foundation

// MARK: - view
protocol SearchView: class {
    
    func set(repositories: [Repository])
    func beginRefreshing()
    func presentAlert(title: String, message: String)
}

// MARK: - presenter
protocol SearchViewPresentable: class {
    
    var searchHisotryDelegate: SearchResultDelegate { get }
    
    func didSelectRow(repository: Repository)
    func refresh()
    
    func didTouchBookmarkButton(repository: Repository, isBookmarked: Bool)
}

// MARK: - router
protocol SearchWireframe: class {
    
    func showDetail(repository: Repository)
}
