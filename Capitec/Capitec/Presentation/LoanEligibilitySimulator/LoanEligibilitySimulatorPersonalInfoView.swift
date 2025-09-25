//
//  LoanEligibilitySimulatorView.swift
//  Capitec
//
//  Created by Liam Pillaye
//

import SwiftUI

struct LoanEligibilitySimulatorPersonalInfoView: View {
    
    //MARK: PROPERTIES
    @State private var age: String = ""
    @State private var employmentStatus: String = ""
    @State private var employmentDuration: String = ""
    @State private var showFinancialInfoView: Bool = false
    @State private var errorState: String? = nil //Temp to retrieve from VM / Model
    
    //MARK: PRIVATE FUNCTIONS
    @discardableResult private func estimateAction() -> Bool {
        if !age.isEmpty && !employmentStatus.isEmpty && !employmentDuration.isEmpty { //Add validation logic here
            return false
        } else {
            return true
        }
    }
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBarView(
                    title1: Constants.NavigationBar.LoanElilitySimulator.title,
                    title2: Constants.NavigationBar.LoanElilitySimulator.personalInfoTitle,
                    stepCount: 1,
                    showStepper: true).padding(.bottom)
                
                
                //Income
                TextInputView(title: "Age",
                              placeholder: "What is your age?",
                              text: $age,
                              error: $errorState,
                              keyboardType: .numberPad)
                
                //Expenses
                TextInputView(title: "Employment Status",
                              placeholder: "What is your employment status?",
                              text: $employmentStatus,
                              error: $errorState,
                              keyboardType: .numberPad)
                
                //LoanAmount
                TextInputView(title: "Employment Duration",
                              placeholder: "How long have you been employed?",
                              text: $employmentDuration,
                              error: $errorState,
                              keyboardType: .numberPad)
                
                Spacer()
                
                PrimaryButton(buttonTitle: "Go next", isDisabled: estimateAction()) {
                    //                    store.employee.firstName = firstName
                    //                    store.employee.lastName = surname
                    //                    showClientView = true
                }
            }//: VSTACK
            .navigationDestination(isPresented: $showFinancialInfoView) {
                //                OnboardingClientView()
            }
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

#Preview {
    LoanEligibilitySimulatorPersonalInfoView()
}
