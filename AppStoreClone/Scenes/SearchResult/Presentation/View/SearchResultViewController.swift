//
//  SearchResultViewController.swift
//  Practice
//
//  Created by yuka on 2018/12/17.
//  Copyright © 2018 Yuka Matsuo. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    var presenter: SearchResultViewPresentable!
        
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: self)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    private var items: [String] = ["test1", "test2"]
}

extension SearchResultViewController: SearchResultView {
    
    func listViewDidLoad() {
        
    }
    
    func set(searchText: String) {
        searchController.searchBar.text = searchText
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = UITableViewCell()
        newCell.textLabel?.text = items[indexPath.row]
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
