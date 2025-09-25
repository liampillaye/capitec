//
//  NavigationBarView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct NavigationBarView: View {
    
    //MARK: PROPERTIES
    var title1: String
    var title2: String
    @State var stepCount: Int = 0
    @State var showStepper: Bool = true
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                .multilineTextAlignment(.leading)
            Text(title2)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color(Constants.Colors.navigationBarSubtitleColor))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)
            if showStepper == true && stepCount > 0 {
                HStack {
                    Spacer()
                    Text("Step \(stepCount) of 3")
                }//: HSTACK
                .padding(.trailing, 20)
            } else {
                HStack {
                    Spacer()
                }
                .padding(.trailing, 20)
            }
        } //: VSTACK
        .padding(.top, 20)
        .padding(.leading, 20)
    }
}
#Preview {
    NavigationBarView(
        title1: Constants.NavigationBar.LoanElilitySimulator.title,
        title2:Constants.NavigationBar.LoanElilitySimulator.personalInfoTitle,
        stepCount: 1,
        showStepper: true)
}
