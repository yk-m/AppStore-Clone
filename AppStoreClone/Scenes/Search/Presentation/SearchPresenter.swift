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
    
    private var searchText: String? = nil

    init(view: SearchView,
         router: SearchWireframe) {
        self.view = view
        self.router = router
    }
}

extension SearchViewPresenter: SearchViewPresentable {}
