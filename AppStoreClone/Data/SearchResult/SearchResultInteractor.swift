//
//  SearchHistoryInteractor.swift
//  Practice
//
//  Created by yuka on 2018/12/16.
//  Copyright © 2018 Yuka Matsuo. All rights reserved.
//

import Foundation
import RealmSwift

protocol SearchResultUsecase {
    
    func add(query: RepositorySearchQuery)
    func retrieve()
    func retrieveLatestRecord()
    func filter(text: String)
}

protocol SearchResultInteractorDelegate: class {
    
    func interactor(_ interactor: SearchResultUsecase, didUpdate queries: [RepositorySearchQuery])
    func interactor(_ interactor: SearchResultUsecase, didRetrieveHistory queries: [RepositorySearchQuery])
    func interactor(_ interactor: SearchResultUsecase, didRetrieveLatestRecord query: RepositorySearchQuery?)
}

class SearchResultInteractor {
    
    weak var delegate: SearchResultInteractorDelegate?
    
    private let realm: Realm
    private lazy var objects: Results<RepositorySearchQuery> = realm.objects(RepositorySearchQuery.self)
    
    private var notificationToken: NotificationToken? {
        didSet {
            oldValue?.invalidate()
        }
    }
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
}

extension SearchResultInteractor: SearchResultUsecase {
    
    func add(query: RepositorySearchQuery) {
        query.searchAt = Date()
        
        if let before = objects.first(where: { $0.keyword == query.keyword }) {
            
            try? realm.write {
                before.searchAt = Date()
            }
        } else {
            try? realm.write {
                realm.add(query, update: .all)
            }
        }
        
        let queries = objects.sorted(byKeyPath: "searchAt", ascending: false)
        delegate?.interactor(self, didUpdate: Array(queries))
    }
    
    func retrieve() {
        let queries = objects.sorted(byKeyPath: "searchAt", ascending: false)
        delegate?.interactor(self, didRetrieveHistory: Array(queries))
    }
    
    func retrieveLatestRecord() {
        let query = objects
            .sorted(byKeyPath: "searchAt", ascending: false)
            .first
        delegate?.interactor(self, didRetrieveLatestRecord: query)
    }
    
    func filter(text: String) {
        guard !text.isEmpty else {
            retrieve()
            return
        }
        
        let queries = objects
            .filter("keyword contains %@", text.realmEscaped)
            .filter("keyword != %@", text.realmEscaped)
            .sorted(byKeyPath: "searchAt", ascending: false)
        
        delegate?.interactor(self, didRetrieveHistory: Array(queries))
    }
    
    func subscribeHistoryUpdate(onHistoryUpdate: @escaping (RealmCollectionChange<Results<RepositorySearchQuery>>) -> Void) {
//        notificationToken = objects.observe { results in
//            switch results {
//                case .update(<#T##CollectionType#>, deletions: <#T##[Int]#>, insertions: <#T##[Int]#>, modifications: <#T##[Int]#>)
//            }
//            onHistoryUpdate(results)
//        }
    }
}
