//
//  ProductsRespository.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

enum ProductsRepositoryError: Error {
    case noProductsFound
    case noProductFound
}


protocol ProductsRepository {
    func getProducts() throws -> [Product]
    func getProductBy(id: String) throws -> Product
    func saveProducts(_ product: [Product])
}

final class DefaultProductRepository: ProductsRepository {
    
    //MARK: PRIVATE PROPERTIES
    private(set) var products: [Product]? = nil
    
    //MARK: INITS
    init(products: [Product]? = nil) {
        self.products = products
    }

    //MARK: PUBLIC FUNCTIONS
    func getProducts() throws -> [Product] {
        guard let products = products  else {
            throw ProductsRepositoryError.noProductsFound
        }
        return products
    }
    
    func getProductBy(id: String) throws -> Product {
        guard let product = products?.first(where: { $0.id == id }) else {
            throw ProductsRepositoryError.noProductFound
        }
        
        return product
    }
    
    func saveProducts(_ products: [Product]) {
        self.products = products
    }
}



