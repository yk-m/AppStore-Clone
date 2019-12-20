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
    
    private lazy var searchResultView = SearchResultRouter.assembleModules()
    private lazy var searchController: UISearchController = searchResultView.searchController
    
    private var sections: [String] = ["section1", "section2"]
    private var items: [String] = ["test1", "test2"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        
        navigationItem.title = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchResultView.listViewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .almostWhite
        
        edgesForExtendedLayout = .all
        tableView.contentInsetAdjustmentBehavior = .always
        
        tableView.register(cellType: SectionHeaderView.self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerFooterView = tableView.dequeueReusableHeaderFooterView(with: SectionHeaderView.self)
        headerFooterView.set(title: sections[section])
        return headerFooterView
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
