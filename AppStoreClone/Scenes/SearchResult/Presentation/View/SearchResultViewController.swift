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
    
    private var shouldShowApps: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private var predictions: [String] = ["賃貸物件検索", "アルバイト"]
    private var apps = [
        StoreApp(title: "ニフティ不動産", description: "お家さがしアプリはニフティ不動産", rating: 4.2, ratingCount: "32K", iconImage: UIImage(named: "fudosan-icon"), descriptionImage: UIImage(named: "fudosan-description")),
        StoreApp(title: "ニフティアルバイト", description: "バイト探し！高校生短期バイト！", rating: 4.5, ratingCount: "11K", iconImage: UIImage(named: "arbeit-icon"), descriptionImage: UIImage(named: "arbeit-description")),
        StoreApp(title: "ニフティ温泉", description: "現在地から温泉が探せる！お得なクーポンや口コミ情報も満載", rating: 4.1, ratingCount: "422", iconImage: UIImage(named: "onsen-icon"), descriptionImage: UIImage(named: "onsen-description")),
        StoreApp(title: "おたよりBOX - 写真で子供のプリント整理", description: "家族で子どものおたよりをきれいに保存・管理する写真共有アプリ", rating: 2.7, ratingCount: "18", iconImage: UIImage(named: "box-icon"), descriptionImage: UIImage(named: "box-description"))
    ]
    
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
        tableView.register(cellType: AppCell.self)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(with: SectionHeaderView.self)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (shouldShowApps) {
            return 0
        }
        return 16
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (shouldShowApps) {
            return apps.count
        }
        return predictions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (shouldShowApps) {
            let newCell = tableView.dequeueReusableCell(with: AppCell.self, for: indexPath)
            newCell.set(app: apps[indexPath.row])
            return newCell
        }
        let newCell = tableView.dequeueReusableCell(with: PredictionCell.self, for: indexPath)
        newCell.set(keyword: predictions[indexPath.row])
        return newCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shouldShowApps = !shouldShowApps
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
