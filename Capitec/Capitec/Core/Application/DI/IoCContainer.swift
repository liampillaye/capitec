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
        
        //MARK: MANAGERS
        register { DefaultLoanEligibilitySimulatorManager(service: resolve(), validationRepository: resolve()) as LoanEligibilitySimulatorManager }
        register { DefaultProductsManager(repository: resolve(), service: resolve(), store: ApplicationStore.instance) as ProductsManager }
        
        //MARK: REPOSITORIES
        register { DefaultValidationRulesRepository() as ValidationRulesRepository }
        register { DefaultProductRepository() as ProductsRepository }

        
        //MARK: SERVICES
        register { MockLoanEligibilitySimulatorService() as LoanEligibilitySimulatorService }
        
        //MARK:VIEWMODELS
        register { @MainActor in LoanEligibilitySimulatorPersonalInfoViewModel(manager: resolve())}
        register { @MainActor in LoanEligibilitySimulatorFinancialInfoViewModel(manager: resolve())}
        register { @MainActor in LoanEligibilitySimulatorLoanDetailsViewModel(manager: resolve())}
        register { @MainActor in ProductsViewModel(manager: resolve()) }
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
