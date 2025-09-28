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
    var selectedProduct: Product? = nil
    var loanDetails: LoanDetails? = nil
    var personalInfo: PersonalInfo? = nil
    
    //MARK: SHARED
    static let instance = ApplicationStore()
    
    //MARK: PRIVATE INIT
    private init() {}
        
    //MARK: PUBLIC FUNCTIONS
    public func setProducts(_ products: [Product]) {
        self.products = products
    }
    
    public func setSelectedProduct(_ product: Product) {
        self.selectedProduct = product
    }
    
    public func setLoanDetails(_ loanDetails: LoanDetails) {
        self.loanDetails = loanDetails
    }
    
    public func setPersonalInfo(_ personalInfo: PersonalInfo) {
        self.personalInfo = personalInfo
    }
}
