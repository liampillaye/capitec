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
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(Color(Constants.Colors.primaryThemeColor))

        //Register Dependencies
        IoCContainer.registerDependencies()
    }
    
    var body: some Scene {
        
        WindowGroup {
            let store: ApplicationStore = ApplicationStore.instance
            let viewModel: ProductsViewModel = IoCContainer.resolve()
            ProductsView(viewModel: viewModel)
                .environmentObject(store)
        }
    }
}
