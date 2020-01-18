//
//  SearchViewController.swift
//  
//
//  Created by yuka on 2020/01/18.
//

import UIKit


class SearchViewController: UITableViewController {

    var presenter: SearchViewPresentable!
    
    private lazy var searchResultView = SearchResultRouter.assembleModules()
    private lazy var searchController: UISearchController = searchResultView.searchController
    
    private var items = [
        ExploreCellType.header(content: "Explore Apps"),
        ExploreCellType.text(content: "賃貸物件検索", shouldHideBorder: true),
        ExploreCellType.text(content: "ニフティアルバイト", shouldHideBorder: false),
        ExploreCellType.header(content: "Explore Games"),
        ExploreCellType.text(content: "ニフティ温泉", shouldHideBorder: true),
        ExploreCellType.text(content: "おたよりBox", shouldHideBorder: false)
    ]
        
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
        
        tableView.register(cellType: ExploreHeaderCell.self)
        tableView.register(cellType: ExploreTextCell.self)
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let newCell = tableView.dequeueReusableCell(with: item.type, for: indexPath)
        item.setUp(targetCell: newCell, indexPath: indexPath)
        return newCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchView
extension SearchViewController: SearchView {}
