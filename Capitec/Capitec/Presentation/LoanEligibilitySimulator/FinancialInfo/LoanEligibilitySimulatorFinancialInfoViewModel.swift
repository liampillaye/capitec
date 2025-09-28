//
//  LoanEligibilitySimulatorFinancialInfoViewModel.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation
import Combine

@MainActor internal final class LoanEligibilitySimulatorFinancialInfoViewModel: ObservableObject {
    
    //MARK: - PROPERTIES
    private let formValidator: FormValidator = FormValidator()
    private let manager: LoanEligibilitySimulatorManager
    private var cancellables = Set<AnyCancellable>()
    private let store = ApplicationStore.instance
    @Published private(set) var isBusy: Bool = false
    
    //MARK: - FORM FIELDS -
    @Published var monthlyIncome: FormField = FormField(for: "monthlyIncome", ruleType: .minOnlyRule)
    @Published var monthlyExpenses: FormField = FormField(for: "monthlyExpenses", ruleType: .minOnlyRule)
    @Published var creditScore: FormField = FormField(for: "creditScore", ruleType: .minMaxIntRule)
    @Published var shouldForceUpdate: Bool = false
    
    //MARK: - INITS -
    init(manager: LoanEligibilitySimulatorManager) {
        self.manager = manager
        
        formValidator.addFields(fields: [
            self.monthlyIncome,
            self.monthlyExpenses,
            self.creditScore])
        
        formValidator.$forceUpdate
            .sink { forceUpdate in
                self.shouldForceUpdate = forceUpdate
            }
            .store(in: &cancellables)
    }
    
    func validate(financialInfo: FinancialInfo) -> Bool {
        
        do {
            let financialInfoValidationRules = try self.manager.fetchFinancialInfoValidationRules()
            formValidator.addRule(for: "monthlyIncome", rule: financialInfoValidationRules.monthlyIncome)
            formValidator.addRule(for: "monthlyExpenses", rule: financialInfoValidationRules.monthlyExpenses)
            formValidator.addRule(for: "creditScore", rule: financialInfoValidationRules.creditScore)
            let isValid = formValidator.validate()
            if isValid {
                store.setFinacialInfo(financialInfo)
            }
            return isValid
        } catch {
            return false //Handle error
        }
    }
    
    func fetchValidationRules() throws {
        try self.manager.fetchAndSaveValidationRules()
    }
    
    func checkEligibility() throws -> Bool {
        do {
            let eligibility = try self.manager.checkEligibility()
            store.setEligiblity(eligibility)
            return true
        } catch {
            return false
        }
    }
}
