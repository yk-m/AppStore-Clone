//
//  SearchResultPresenter.swift
//  Practice
//
//  Created by Yuka Matsuo on 25/01/2019.
//  Copyright © 2019 yuka. All rights reserved.
//

import Foundation

class SearchResultViewPresenter {

    private weak var view: SearchResultView?
    private let router: SearchResultWireframe
    
    init(view: SearchResultView,
         router: SearchResultWireframe) {
        self.view = view
        self.router = router
    }
    
    private var searchText: String? {
        didSet {
            guard let searchText = searchText else {
                return
            }
            view?.set(searchText: searchText)
        }
    }
}

extension SearchResultViewPresenter: SearchResultViewPresentable {
    
    func willPresentSearchController() {}
    
    func searchBarSearchButtonClicked(searchText: String?) {
        self.searchText = searchText
    }
    
    func searchBarCancelButtonClicked() {
        searchText = nil
    }
}
