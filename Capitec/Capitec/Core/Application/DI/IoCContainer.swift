//
//  IoCContainer.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

final class IoCContainer {
    private static var factories: [String: () -> Any] = [:]
    
    static func registerDependencies() {
        register { MockLoanEligibilitySimulatorService() as LoanEligibilitySimulatorService }
        register { DefaultValidationRulesRepository() as ValidationRulesRepository }
        register { DefaultLoanEligibilitySimulatorManager(service: resolve(), validationRepository: resolve()) as LoanEligibilitySimulatorManager }
        register { @MainActor in LoanEligibilitySimulatorPersonalInfoViewModel(manager: resolve())}
    }
    
    static func register<T>(_ factory: @escaping () -> T) {
           let key = String(describing: T.self)
           factories[key] = factory as () -> Any
    }

    static func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let factory = factories[key], let value = factory() as? T else {
            fatalError("No registration for " + key)
        }
        return value
    }
}
