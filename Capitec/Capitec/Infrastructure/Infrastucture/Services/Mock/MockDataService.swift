//
//  MockDataService.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

class MockDataService: ObservableObject {
    
    //MARK: PROPERTIES
    static let shared = MockDataService()
    private(set) var store: ApplicationStore
    
    
    //MARK: INITIALISERS
    private init() {
        store = ApplicationStore.instance
    }
    
    //MARK: PUBLIC METHODS
    func loadDataFromBundle(_ mockResource: String) {
//        let bundle = Bundle(for: type(of: self))
//        let _: Branches = bundle.decode(mockResource)
    }
}

