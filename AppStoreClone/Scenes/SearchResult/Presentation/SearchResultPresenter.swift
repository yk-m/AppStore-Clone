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
    private let searchHistoryInteractor: SearchResultUsecase
    
    init(view: SearchResultView,
         router: SearchResultWireframe,
         searchHistoryInteractor: SearchResultUsecase) {
        self.view = view
        self.router = router
        self.searchHistoryInteractor = searchHistoryInteractor
    }
    
    private var searchText: String? {
        didSet {
            router.select(searchText: searchText)
            
            guard let searchText = searchText else {
                return
            }
            let query = RepositorySearchQuery(keyword: searchText)
            searchHistoryInteractor.add(query: query)
            view?.set(searchText: query.keyword)
        }
    }
}

extension SearchResultViewPresenter: SearchResultViewPresentable {
    
    func listViewDidLoad() {
        searchHistoryInteractor.retrieveLatestRecord()
    }
    
    func willPresentSearchController() {
        searchHistoryInteractor.retrieve()
    }
    
    func didSelectRow(query: RepositorySearchQuery) {
        searchText = query.keyword
    }
    
    func updateSearchResults(searchText: String?) {
        searchHistoryInteractor.filter(text: searchText ?? "")
    }
    
    func searchBarSearchButtonClicked(searchText: String?) {
        self.searchText = searchText
    }
    
    func searchBarCancelButtonClicked() {
        searchText = nil
    }
}

extension SearchResultViewPresenter: SearchResultInteractorDelegate {
    
    func interactor(_ interactor: SearchResultUsecase, didUpdate queries: [RepositorySearchQuery]) {
        view?.set(queries: queries)
    }
    
    func interactor(_ interactor: SearchResultUsecase, didRetrieveHistory queries: [RepositorySearchQuery]) {
        view?.set(queries: queries)
    }
    
    func interactor(_ interactor: SearchResultUsecase, didRetrieveLatestRecord query: RepositorySearchQuery?) {
        guard let searchText = query?.keyword else {
            return
        }
        
        self.searchText = searchText
    }
}

