//
//  EligibilityViewModel.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

@MainActor internal final class EligibilityViewModel: ObservableObject {
    
    //MARK: PRIVATE PROPERTIES
    private let manager: LoanEligibilitySimulatorManager
    
    //MARK: PUBLISHED PROPERTIES
    
    //MARK: - INITS
    init(manager: LoanEligibilitySimulatorManager) {
        self.manager = manager
    }
}
