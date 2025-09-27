//
//  ProductsView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation


@MainActor internal final class ProductsViewModel: ObservableObject {
    
    //MARK: PRIVATE PROPERTIES
    private let manager: ProductsManager
    
    //MARK: PUBLISHED PROPERTIES
    @Published private(set) var productSelected: Bool = false
    @Published private(set) var products: [Product] = []
    
    //MARK: - INITS
    init(manager: ProductsManager) {
        self.manager = manager
    }
    
    //MARK: - PUBLIC FUNCTIONS
    func fetchProducts() {
        do {
            let products = try self.manager.fetchProducts()
            self.products = products
        } catch {
            productSelected = false
        }
    }
    
    func selectProduct(product: Product) {
        self.manager.saveSelectedProduct(product)
        productSelected = true
    }
}
