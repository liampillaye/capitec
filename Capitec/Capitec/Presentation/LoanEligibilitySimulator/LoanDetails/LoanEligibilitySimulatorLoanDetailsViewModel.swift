//
//  LoanEligibilitySimulatorLoanDetailsViewModel.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation
import Combine

@MainActor internal final class LoanEligibilitySimulatorLoanDetailsViewModel: ObservableObject {
        
    private let formValidator: FormValidator = FormValidator()
    private let manager: LoanEligibilitySimulatorManager
    
    @Published private(set) var isBusy: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Form Fields -
    @Published var requestAmount: FormField = FormField(for: "requestAmount", ruleType: .minMaxDoubleRule)
    @Published var loanTerm: FormField = FormField(for: "loanTerm", ruleType: .minMaxIntRule)
    @Published var shouldForceUpdate: Bool = false
    
    //MARK: - Inits -
    init(manager: LoanEligibilitySimulatorManager) {
        self.manager = manager

        formValidator.addFields(fields: [
            self.requestAmount,
            self.loanTerm])
        
        formValidator.$forceUpdate
            .sink { forceUpdate in
                self.shouldForceUpdate = forceUpdate
            }
            .store(in: &cancellables)
    }
    
    func validate() -> Bool {
        
        do {
            let validationRuleLoanDetails = try self.manager.fetchLoanDetailsValidationRules()
            formValidator.addRule(for: "requestAmount", rule: validationRuleLoanDetails.requestedAmount)
            formValidator.addRule(for: "loanTerm", rule: validationRuleLoanDetails.loanTerm)
            return formValidator.validate()
        } catch {
            return false //Handle error
        }
    }
    
    func fetchValidationRules() throws {
        try self.manager.fetchAndSaveValidationRules()
    }
}
