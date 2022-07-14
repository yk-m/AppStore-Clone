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
    
    func set(searchText: String)
    func showSearchResult(searchText: String)
    func showPredictions()
}

// MARK: - presenter
protocol SearchResultViewPresentable: class {
    
    func showSearchResult(searchText: String)
    func updateSearchResults(searchText: String?)
    func searchBarSearchButtonClicked(searchText: String?)
    func searchBarCancelButtonClicked()
}

// MARK: - router
protocol SearchResultWireframe: class {}
