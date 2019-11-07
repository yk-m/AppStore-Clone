//
//  SearchPresenter.swift
//  Practice
//
//  Created by Yuka Matsuo on 16/12/2018.
//  Copyright © 2018 yuka. All rights reserved.
//

import Foundation

class SearchViewPresenter {

    private weak var view: SearchView?
    private let router: SearchWireframe
    private let repositoryInteractor: RepositoryUsecase
    private let bookmarkInteractor: BookmarkUsecase
    
    private var searchText: String? = nil

    init(view: SearchView,
         router: SearchWireframe,
         repositoryInteractor: RepositoryUsecase,
         bookmarkInteractor: BookmarkUsecase) {
        self.router = router
        self.view = view
        self.repositoryInteractor = repositoryInteractor
        self.bookmarkInteractor = bookmarkInteractor
    }
}

extension SearchViewPresenter: SearchViewPresentable {
    
    var searchHisotryDelegate: SearchResultDelegate {
        return self
    }
    
    func didSelectRow(repository: Repository) {
        router.showDetail(repository: repository)
    }
    
    func refresh() {
        guard let searchText = searchText,
            !searchText.isEmpty else {
                view?.set(repositories: [])
                return
        }
        
        let query = RepositorySearchQuery(keyword: searchText)
        repositoryInteractor.retrieve(query: query)
    }
    
    func didTouchBookmarkButton(repository: Repository, isBookmarked: Bool) {
        if isBookmarked {
            bookmarkInteractor.remove(repository: repository)
        } else {
            bookmarkInteractor.add(repository: repository)
        }
    }
}

// MARK: - SearchResultViewDelegate
extension SearchViewPresenter: SearchResultDelegate {
    
    func searchHistory(_ searchHistory: SearchResultRouter, didSelect searchText: String?) {
        self.searchText = searchText
        guard searchText != nil else {
            view?.set(repositories: [])
            return
        }
        view?.beginRefreshing()
    }
}

// MARK: - RepositoryInteractorDelegate
extension SearchViewPresenter: RepositoryInteractorDelegate {
    
    func interactor(_ interactor: RepositoryUsecase, didRetrieveRepositories repositories: [Repository]) {
        view?.set(repositories: repositories)
        
        if repositories.count == 0 {
            view?.presentAlert(title: "見つかりませんでした", message: "キーワードを変えてお試しください。")
        }
    }
    
    func interactor(_ interactor: RepositoryUsecase, didFailWithError error: GitHubClientError) {
        view?.set(repositories: [])
        
        switch error {
        case .connectionError(_):
            view?.presentAlert(title: "通信に失敗しました", message: "ネットワーク接続を確認してください。")
        case .responseParseError(_):
            view?.presentAlert(title: "ただいま混み合っています", message: "時間をあけて再度お試しください。")
        case .apiError(let error):
            view?.presentAlert(title: "エラーが発生しました", message: error.message)
        }
    }
}

// MARK: - BookmarkInteractorDelegate
extension SearchViewPresenter: BookmarkInteractorDelegate {
    
    func interactor(_ interactor: BookmarkUsecase, didUpdateBookmark repository: Repository, isBookmarked: Bool) {
        print("ブックマークしました")
    }
}
