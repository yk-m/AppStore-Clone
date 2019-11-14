//
//  SearchViewController.swift
//  Practice
//
//  Created by Yuka Matsuo on 16/12/2018.
//  Copyright © 2018 yuka. All rights reserved.
//

import UIKit
import SwiftUI


class SearchViewController: UITableViewController {

    var presenter: SearchViewPresentable!
    
    private lazy var searchHistoryView = SearchResultRouter.assembleModules()
    private lazy var searchController: UISearchController = searchHistoryView.searchController
    
    private var items: [String] = ["test1", "test2"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        
        navigationItem.title = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchHistoryView.listViewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .almostWhite
        
        edgesForExtendedLayout = .all
        tableView.contentInsetAdjustmentBehavior = .always
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = UITableViewCell()
        newCell.textLabel?.text = items[indexPath.row];
        return newCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchView
extension SearchViewController: SearchView {}
