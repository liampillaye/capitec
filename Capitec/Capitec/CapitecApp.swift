//
//  CapitecApp.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

@main
struct CapitecApp: App {
    var body: some Scene {
        
        let store: ApplicationStore = ApplicationStore.instance
        let mockService = MockDataService.shared

        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(mockService)
        }
    }
}
