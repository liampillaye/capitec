//
//  DefaultProductManager.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

final class DefaultProductsManager: ProductsManager {
    
    //MARK: PROPERTIES
    private(set) var repository: ProductsRepository
    private(set) var service: LoanEligibilitySimulatorService
    private(set) var store: ApplicationStore
    
    
    //MARK: - INITS
    init(repository: ProductsRepository,
         service: LoanEligibilitySimulatorService,
         store: ApplicationStore) {
        self.repository = repository
        self.service = service
        self.store = store
    }
    
    //MARK: PUBLIC FUNCTIONS
    func fetchProducts() throws -> [Product] {
        do {
            let products = try self.service.getProducts()
            self.repository.saveProducts(products)
            store.setProducts(products)
            return products
        } catch {
            throw error
        }
        
    }
    
    func saveSelectedProduct(_ product: Product) throws {
        
    }
}
