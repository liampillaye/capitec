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
    @Published var paymentSchedule: [MontlyPaymentSchedule] = []
    private(set) var selectedProduct: Product? = nil
    private(set) var loanDetails: LoanDetails? = nil
    private(set) var personalInfo: PersonalInfo? = nil
    private(set) var financialInfo: FinancialInfo? = nil
    private(set) var eligibility: Eligibility? = nil
    private(set) var calculateRate: CalculateRate? = nil
    
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
    
    public func setFinacialInfo(_ financialInfo: FinancialInfo) {
        self.financialInfo = financialInfo
    }
    
    public func setEligiblity(_ eligiblity: Eligibility) {
        self.eligibility = eligiblity
    }
    
    public func setCalculateRate(_ calculateRate: CalculateRate) {
        self.calculateRate = calculateRate
        self.paymentSchedule = calculateRate.paymentSchedule
    }
}
