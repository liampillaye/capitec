//
//  LoanEligibilitySimulatorLoanDetailsView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorLoanDetailsView: View {
    
    //MARK: PROPERTIES
    @State private var requestedAmount: String = ""
    @State private var loanTerm: String = ""
    @State private var loanPurpose: String = ""
    @State private var errorState: String? = nil //Temp to retrieve from VM / Model
    @State private var showEligibilityView: Bool = false
    
    
    //MARK: PRIVATE FUNCTIONS
    @discardableResult private func estimateAction() -> Bool {
        if !requestedAmount.isEmpty && !loanTerm.isEmpty && !loanPurpose.isEmpty { //Add validation logic here
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
                    title2: Constants.NavigationBar.LoanElilitySimulator.loanDetailsTitle,
                    stepCount: 3,
                    showStepper: true).padding(.bottom)
                
                
                Group {
                    //Requested Amount
                    TextInputView(title: "Requested Amount",
                                  placeholder: "What is your requested Amount?",
                                  text: $requestedAmount,
                                  error: $errorState,
                                  keyboardType: .numberPad)
                    
                    //Loan Term
                    TextInputView(title: "Loan Term",
                                  placeholder: "What is the term (months)?",
                                  text: $loanTerm,
                                  error: $errorState,
                                  keyboardType: .numberPad)
                    
                    //Loan Purpose
                    TextInputView(title: "Loan Purpose",
                                  placeholder: "What is the purpose of the loan?",
                                  text: $loanPurpose,
                                  error: $errorState,
                                  keyboardType: .numberPad)
                    
                }//:GROUP
                
                
                Spacer()
                
                PrimaryButton(buttonTitle: "Continue", isDisabled: estimateAction()) {
                    //                    store.employee.firstName = firstName
                    //                    store.employee.lastName = surname
                    //                    showClientView = true
                }
            }//: VSTACK
            .navigationDestination(isPresented: $showEligibilityView) {
                //                OnboardingClientView()
            }
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

#Preview {
    LoanEligibilitySimulatorLoanDetailsView()
}
