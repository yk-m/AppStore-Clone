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

    static func assembleModules() -> SearchViewController {
        let view = SearchViewController()
        let router = SearchRouter(viewController: view)
        let presenter = SearchViewPresenter(view: view,
                                          router: router)

        view.presenter = presenter

        return view
    }
}

// MARK: - SearchWireframe
extension SearchRouter: SearchWireframe {}
