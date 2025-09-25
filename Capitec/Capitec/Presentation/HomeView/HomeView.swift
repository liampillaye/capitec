//
//  ContentView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
    }
    
    var body: some View {
            TabView {
                LoanEligibilitySimulatorPersonalInfoView()
                    .tabItem {
                        Label("Loan Simulator", systemImage: "creditcard.arrow.trianglehead.2.clockwise.rotate.90")
                    }
                BranchLocatorMapView()
                    .tabItem {
                        Label("Branch Locator", systemImage: "location.magnifyingglass")
                    }
            }
        .accentColor(Color("PrimaryColor"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}
