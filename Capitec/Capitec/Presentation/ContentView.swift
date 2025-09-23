//
//  ContentView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var mockDataService: MockDataService

    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
                mockDataService.loadDataFromBundle("MockBranches.json")
        }
    }
}

#Preview {
    ContentView()
}
