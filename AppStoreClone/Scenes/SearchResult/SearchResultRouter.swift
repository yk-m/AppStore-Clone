//
//  SearchResultRouter.swift
//  Practice
//
//  Created by Yuka Matsuo on 25/01/2019.
//  Copyright © 2019 yuka. All rights reserved.
//

import UIKit

class SearchResultRouter {
    
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> SearchResultView {
        let view = SearchResultViewController()
        let router = SearchResultRouter(viewController: view)
        let presenter = SearchResultViewPresenter(view: view,
                                                   router: router)

        view.presenter = presenter
        
        return view
    }
}

extension SearchResultRouter: SearchResultWireframe {}
