//
//  MockDataService.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

struct MockDataService {
    
    //MARK: PROPERTIES
    static let shared = MockDataService()
    private(set) var store: ApplicationStore
    
    private mutating func loadPersistentStore() {
        let defaults = UserDefaults.standard
        
        if let storeData = defaults.object(forKey: Constants.Store.Bundle) as? Data {
            let decoder = JSONDecoder()
            if let persistentStore = try? decoder.decode(ApplicationStore.self, from: storeData) {
                store = persistentStore
            }
        }
    }
    
    //MARK: INITIALISERS
    private init() {
        let branches: Branches = Bundle.main.decode(Constants.Mocks.Branch) //TODO: INJECT MOCK TYPE
        store = ApplicationStore(branches: branches.branches)
        loadPersistentStore()
    }
    
    func saveStore() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(store) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: Constants.Store.Bundle)
        }
    }
}

