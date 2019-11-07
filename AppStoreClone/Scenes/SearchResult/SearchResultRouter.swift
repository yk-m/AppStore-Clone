//
//  SearchResultRouter.swift
//  Practice
//
//  Created by Yuka Matsuo on 25/01/2019.
//  Copyright © 2019 yuka. All rights reserved.
//

import UIKit

protocol SearchResultDelegate: class {
    
    func searchHistory(_ searchHistory: SearchResultRouter, didSelect searchText: String?)
}

class SearchResultRouter {
    
    weak var delegate: SearchResultDelegate?

    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules(delegate: SearchResultDelegate?) -> SearchResultView {
        let view = SearchResultViewController()
        let router = SearchResultRouter(viewController: view)
        let searchHistoryInteractor = SearchResultInteractor()
        let presenter = SearchResultViewPresenter(view: view,
                                                   router: router,
                                                   searchHistoryInteractor: searchHistoryInteractor)

        view.presenter = presenter
        
        router.delegate = delegate
        searchHistoryInteractor.delegate = presenter
        
        return view
    }
}

extension SearchResultRouter: SearchResultWireframe {

    func select(searchText: String?) {
        delegate?.searchHistory(self, didSelect: searchText)
    }
}
