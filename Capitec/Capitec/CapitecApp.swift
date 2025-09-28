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
        //Register Dependencies
        IoCContainer.registerDependencies()
    }
    
    var body: some Scene {
        
        WindowGroup {
            let store: ApplicationStore = ApplicationStore.instance
            let viewModel: ProductsViewModel = IoCContainer.resolve()
            ProductsView(viewModel: viewModel)
                .environmentObject(store)

//            let viewModel: LoanEligibilitySimulatorPersonalInfoViewModel = IoCContainer.resolve()
//            LoanEligibilitySimulatorPersonalInfoView(viewModel: viewModel)
//                .environmentObject(store)
        }
    }
}
