//
//  MockProductManager.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

final class MockProductsManager: ProductsManager {
    func fetchProducts() throws -> [Product] {
        //Do nothing
        return []
    }
    
    func saveSelectedProduct(_ product: Product) {
        //Do nothing
    }
}
