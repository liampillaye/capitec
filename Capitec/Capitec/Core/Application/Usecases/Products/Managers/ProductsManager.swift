//
//  ProductsManager.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

protocol ProductsManager {
    func fetchProducts() throws -> [Product]
    func saveSelectedProduct(_ product: Product) throws
}


