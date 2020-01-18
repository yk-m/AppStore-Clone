//
//  SearchResultViewController.swift
//  Practice
//
//  Created by yuka on 2018/12/17.
//  Copyright © 2018 Yuka Matsuo. All rights reserved.
//

import UIKit

class SearchResultViewController: UITableViewController {
    
    var presenter: SearchResultViewPresentable!
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: self)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    private var items: [String] = ["賃貸物件検索", "アルバイト"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        extendedLayoutIncludesOpaqueBars = true
        
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        
        tableView.register(cellType: SectionHeaderView.self)
        tableView.register(cellType: PredictionCell.self)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(with: SectionHeaderView.self)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(with: PredictionCell.self, for: indexPath)
        newCell.set(title: items[indexPath.row])
        return newCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchResultView
extension SearchResultViewController: SearchResultView {
    
    func listViewDidLoad() {
        
    }
    
    func set(searchText: String) {
        searchController.searchBar.text = searchText
    }
}

// MARK: - UISearchControllerDelegate
extension SearchResultViewController: UISearchControllerDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController) {}
}

// MARK: - UISearchResultsUpdating
extension SearchResultViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
//        presenter.updateSearchResults(searchText: searchController.searchBar.text)
    }
}

// MARK: - UISearchBarDelegate
extension SearchResultViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchBarSearchButtonClicked(searchText: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchBarCancelButtonClicked()
    }
}

// MARK: - HistoryCellDelegate
extension SearchResultViewController: HistoryCellDelegate {
    
    func historyCell(_ historyCell: HistoryCell, didTouchUpInside keyword: String) {
        searchController.searchBar.text = keyword
    }
}
