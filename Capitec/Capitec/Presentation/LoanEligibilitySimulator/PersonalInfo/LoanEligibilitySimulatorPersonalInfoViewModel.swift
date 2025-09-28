//
//  LoanEligibilitySimulatorPersonalInfoViewModel.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation
import Combine

@MainActor internal final class LoanEligibilitySimulatorPersonalInfoViewModel: ObservableObject {
        
    //MARK: PRIVATE PROPERTIES
    private let formValidator: FormValidator = FormValidator()
    private let manager: LoanEligibilitySimulatorManager
    private var cancellables = Set<AnyCancellable>()
    private let store = ApplicationStore.instance

    //MARK: PUBLISHED PROPERTIES
    @Published private(set) var isBusy: Bool = false
    @Published var age: FormField = FormField(for: "age", ruleType: .minMaxIntRule)
    @Published var employmentStatus: FormField = FormField(for: "employmentStatus", ruleType: .optionsRule)
    @Published var employmentDuration: FormField = FormField(for: "employmentDuration", ruleType: .minOnlyRule)
    @Published var shouldForceUpdate: Bool = false
    @Published var employeeStatusOptions: [String] = []
    
    //MARK: - INITS
    init(manager: LoanEligibilitySimulatorManager) {
        self.manager = manager

        formValidator.addFields(fields: [self.age, self.employmentStatus, self.employmentDuration])
        
        formValidator.$forceUpdate
            .sink { forceUpdate in
                self.shouldForceUpdate = forceUpdate
            }
            .store(in: &cancellables)
    }
    
    //MARK: - PUBLIC FUNCTIONS
    func validate(personalInfo: PersonalInfo) -> Bool {
        
        do {
            let personalInfoValidationRules = try self.manager.fetchPersonalInfoValidationRules()
            formValidator.addRule(for: "age", rule: personalInfoValidationRules.age)
            formValidator.addRule(for: "employmentStatus", rule: personalInfoValidationRules.employmentStatus)
            formValidator.addRule(for: "employmentDuration", rule: personalInfoValidationRules.employmentDuration)
            let isValid = formValidator.validate()
            if isValid {
                store.setPersonalInfo(personalInfo)
            }
            return isValid
        } catch {
            return false //Handle error
        }
    }
    
    func fetchValidationRules() throws {
        do {
            try self.manager.fetchAndSaveValidationRules()
            let personalInfoValidationRules = try self.manager.fetchPersonalInfoValidationRules()
            employeeStatusOptions = personalInfoValidationRules.employmentStatus.options ?? []
        } catch {
            throw error
        }
    }
}
