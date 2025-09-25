//
//  CapitecApp.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

@main
struct CapitecApp: App {
    
    init() {
        IoCContainer.registerDependencies()
    }
    
    var body: some Scene {
        
        WindowGroup {
            let viewModel: LoanEligibilitySimulatorPersonalInfoViewModel = IoCContainer.resolve()
            LoanEligibilitySimulatorPersonalInfoView(viewModel: viewModel)
        }
    }
}
