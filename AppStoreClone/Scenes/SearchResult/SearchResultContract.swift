//
//  SearchResultContract.swift
//  Practice
//
//  Created by Yuka Matsuo on 25/01/2019.
//  Copyright © 2019 yuka. All rights reserved.
//

import Foundation
import UIKit

// MARK: - view
protocol SearchResultView: class {
    
    var searchController: UISearchController { get }
    
    func listViewDidLoad()
    func set(searchText: String)
    func set(queries: [RepositorySearchQuery])
}

// MARK: - presenter
protocol SearchResultViewPresentable: class {
    
    func listViewDidLoad()
    func willPresentSearchController()
    func didSelectRow(query: RepositorySearchQuery)
    func updateSearchResults(searchText: String?)
    func searchBarSearchButtonClicked(searchText: String?)
    func searchBarCancelButtonClicked()
}

// MARK: - router
protocol SearchResultWireframe: class {

    func select(searchText: String?)
}
