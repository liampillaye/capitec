//
//  LoanEligibilitySimulatorPersonalInfoViewModel.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation
import Combine

@MainActor internal final class LoanEligibilitySimulatorPersonalInfoViewModel: ObservableObject {
        
    private let formValidator: FormValidator = FormValidator()
    private let manager: LoanEligibilitySimulatorManager
    
    @Published private(set) var isBusy: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Form Fields -
    @Published var age: FormField = FormField(for: "age", ruleType: .minMaxIntRule)
    @Published var employmentStatus: FormField = FormField(for: "employmentStatus", ruleType: .optionsRule)
    @Published var employmentDuration: FormField = FormField(for: "employmentDuration", ruleType: .minOnlyRule)
    @Published var shouldForceUpdate: Bool = false
    
    //MARK: - Inits -
    init(manager: LoanEligibilitySimulatorManager) {
        self.manager = manager

        formValidator.addFields(fields: [self.age, self.employmentStatus, self.employmentDuration])
        
        formValidator.$forceUpdate
            .sink { forceUpdate in
                self.shouldForceUpdate = forceUpdate
            }
            .store(in: &cancellables)
    }
    
    func validate() -> Bool {
        
        do {
            let personalInfoValidationRules = try self.manager.fetchPersonalInfoValidationRules()
            formValidator.addRule(for: "age", rule: personalInfoValidationRules.age)
            formValidator.addRule(for: "employmentStatus", rule: personalInfoValidationRules.employmentStatus)
            formValidator.addRule(for: "employmentDuration", rule: personalInfoValidationRules.employmentDuration)
            return formValidator.validate()
        } catch {
            return false //Handle error
        }
    }
    
    func fetchValidationRules() throws {
        try self.manager.fetchAndSaveValidationRules()
    }
}
