//
//  LoanEligibilitySimulatorFinancialInfoView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorFinancialInfoView: View {
    
    //MARK: PROPERTIES
    @State private var monthlyIncome: String = ""
    @State private var monthlyExpenses: String = ""
    @State private var existingDebt: String = ""
    @State private var creditScore: Bool = false
    @State private var errorState: String? = nil //Temp to retrieve from VM / Model
    @State private var showLoanDetailsView: Bool = false
    
    
    //MARK: PRIVATE FUNCTIONS
    @discardableResult private func estimateAction() -> Bool {
        if !monthlyIncome.isEmpty && !monthlyExpenses.isEmpty && !existingDebt.isEmpty && !creditScore.description.isEmpty { //Add validation logic here
            return false
        } else {
            return true
        }
    }
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            VStack {
                //Navigation Bar
                NavigationBarView(
                    title1: Constants.NavigationBar.LoanElilitySimulator.title,
                    title2: Constants.NavigationBar.LoanElilitySimulator.financialInfoTitle,
                    stepCount: 2,
                    showStepper: true).padding(.bottom)
                
                
                Group {
                    //Monthly Income
                    TextInputView(title: "Monthly Income",
                                  placeholder: "What is your monthly income?",
                                  text: $monthlyIncome,
                                  error: $errorState,
                                  keyboardType: .numberPad)
                    
                    //Monthly Expenses
                    TextInputView(title: "Monthly Expenses",
                                  placeholder: "What is your monthly expenses?",
                                  text: $monthlyExpenses,
                                  error: $errorState,
                                  keyboardType: .numberPad)
                    
                    //Existing Debt
                    TextInputView(title: "Existing Debt",
                                  placeholder: "How much is your existing debt?",
                                  text: $existingDebt,
                                  error: $errorState,
                                  keyboardType: .numberPad)
                    
                    //Credit Score
                    TextInputView(title: "Credit Score",
                                  placeholder: "What is your current credit score?",
                                  text: $existingDebt,
                                  error: $errorState,
                                  keyboardType: .numberPad)
                }//:GROUP
                
                
                Spacer()
                
                PrimaryButton(buttonTitle: "Go next", isDisabled: estimateAction()) {
                    //                    store.employee.firstName = firstName
                    //                    store.employee.lastName = surname
                    //                    showClientView = true
                }
            }//: VSTACK
            .navigationDestination(isPresented: $showLoanDetailsView) {
                //                OnboardingClientView()
            }
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

#Preview {
    LoanEligibilitySimulatorFinancialInfoView()
}
