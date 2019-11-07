//
//  SearchViewController.swift
//  Practice
//
//  Created by Yuka Matsuo on 16/12/2018.
//  Copyright © 2018 yuka. All rights reserved.
//

import UIKit
import SwiftUI

struct SearchViewControllerWrapper : UIViewControllerRepresentable {

    typealias UIViewControllerType = SearchViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<SearchViewControllerWrapper>) -> SearchViewControllerWrapper.UIViewControllerType {
        return UIViewControllerType()
    }

    func updateUIViewController(_ uiViewController: SearchViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<SearchViewControllerWrapper>) {
    }
}

class SearchViewController: UITableViewController {

//    var presenter: SearchViewPresentable!
    
//    private lazy var searchHistoryView = SearchResultRouter.assembleModules(delegate: presenter.searchHisotryDelegate)
//    private lazy var searchController: UISearchController = searchHistoryView.searchController
    
    private var items: [Repository] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy/M/d HH:ss"
        return dateFormatter
    }()
    
    private var shouldRefreshOnViewDidAppear: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        
        navigationItem.title = "Search"
//        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
//        searchHistoryView.listViewDidLoad()
        
        tableView.register(cellType: ListCell.self)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .almostWhite
        
        edgesForExtendedLayout = .all
        tableView.contentInsetAdjustmentBehavior = .always
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if shouldRefreshOnViewDidAppear {
            tableView.refreshControl?.beginRefreshing()
            shouldRefreshOnViewDidAppear = false
        }
    }
    
    @objc func refresh(sender: UIRefreshControl) {
//        presenter.refresh()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(with: ListCell.self, for: indexPath)
        newCell.set(repository: items[indexPath.row], dateFormatter: dateFormatter)
        newCell.delegate = self
        return newCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter.didSelectRow(repository: items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchView
extension SearchViewController: SearchView {
    
    func set(repositories: [Repository]) {
        items = repositories
        tableView.refreshControl?.endRefreshing()
    }
    
    func beginRefreshing() {
//        searchController.dismiss(animated: true)
        
//        presenter.refresh()
        guard let refreshControl = tableView.refreshControl else {
            shouldRefreshOnViewDidAppear = true
            return
        }
        refreshControl.beginRefreshing()
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController.singleBtnAlert(with: title, message: message, completion: nil)
        present(alert, animated: true, completion: nil)
    }
}

extension SearchViewController: ListCellDelegate {
    
    func listCell(_ listCell: ListCell, didTouchUpInsideAt repository: Repository, isBookmarked: Bool) {
//        presenter.didTouchBookmarkButton(repository: repository, isBookmarked: isBookmarked)
    }
}
