//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by sci01725 on 2019/11/14.
//  Copyright © 2019 Yuka Matsuo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchViewPresentable!
        
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private lazy var searchResultView = SearchResultRouter.assembleModules()
    private lazy var searchController: UISearchController = searchResultView.searchController
    
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
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = UITableViewCell()
        newCell.textLabel?.text = items[indexPath.row];
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchView
extension SearchViewController: SearchView {}
