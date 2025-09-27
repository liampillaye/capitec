//
//  ApplicationStore.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

class ApplicationStore: ObservableObject {
    
    //MARK: PROPERTIES
    @Published var products: [Product] = []
    
    //MARK: SHARED
    static let instance = ApplicationStore()
    
    //MARK: PRIVATE INIT
    private init() {}
        
    public func setProducts(_ products: [Product]) {
        self.products = products
    }
}
