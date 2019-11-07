//
//  SearchRouter.swift
//  Practice
//
//  Created by Yuka Matsuo on 16/12/2018.
//  Copyright © 2018 yuka. All rights reserved.
//

import UIKit
import SwiftUI

class SearchRouter {

    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
//        let view = SearchViewControllerWrapper()
//        let router = SearchRouter(viewController: view)
//        let repositoryInteractor = RepositoryInteractor()
//        let bookmarkInteractor = BookmarkInteractor()
//        let presenter = SearchViewPresenter(view: view,
//                                          router: router,
//                                          repositoryInteractor: repositoryInteractor,
//                                          bookmarkInteractor: bookmarkInteractor)
//
//        view.presenter = presenter
//        repositoryInteractor.delegate = presenter

        return UIViewController()
    }
}

extension SearchRouter: SearchWireframe {

    func showDetail(repository: Repository) {
//        let view = DetailRouter.assembleModules(repository: repository)
//        view.hidesBottomBarWhenPushed = true
//        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
