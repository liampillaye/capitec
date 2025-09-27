//
//  LoanEligibilitySimulatorLoanDetailsView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorLoanDetailsView: View {
    
    
    //MARK: PROPERTIES
    @StateObject var viewModel: LoanEligibilitySimulatorLoanDetailsViewModel
    @State private var requestedAmount: String = ""
    @State private var loanTerm: String = ""
    @State private var loanPurpose: String = ""
    @State private var showEligibilityView: Bool = false
    
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Navigation Bar
                    NavigationBarView(
                        title1: Constants.NavigationBar.LoanElilitySimulator.title,
                        title2: Constants.NavigationBar.LoanElilitySimulator.loanDetailsTitle,
                        stepCount: 1,
                        showStepper: true).padding(.bottom)
                    
                    
                    Group {
                        //Requested Amount
                        TextInputView(title: "Requested Amount",
                                      placeholder: "What is your requested Amount?",
                                      text: $requestedAmount,
                                      error: $viewModel.requestAmount.error,
                                      keyboardType: .numberPad)
                        
                        //Loan Term
                        TextInputView(title: "Loan Term",
                                      placeholder: "What is the term (months)?",
                                      text: $loanTerm,
                                      error: $viewModel.loanTerm.error,
                                      keyboardType: .numberPad)
                        
                        //Loan Purposex
                        TextInputView(title: "Loan Purpose",
                                      placeholder: "What is the purpose of the loan?",
                                      text: $loanPurpose,
                                      error: .constant(.none),
                                      keyboardType: .numberPad)
                        
                    }//:GROUP
                    
                    
                    Spacer()
                    
                    PrimaryButton(buttonTitle: "Continue", isDisabled: false) {
                        viewModel.requestAmount.value = requestedAmount
                        viewModel.loanTerm.value = loanTerm
                        showEligibilityView = viewModel.validate()
                    }
                }//: VSTACK
                .navigationDestination(isPresented: $showEligibilityView) {
//                    let vm: LoanEligibilitySimulatorLoanDetailsViewModel = IoCContainer.resolve()
//                    LoanEligibilitySimulatorLoanDetailsView(viewModel: vm)
                }
                .onAppear() {
                    Task {
                        try viewModel.fetchValidationRules()
                    }
                }
            }//:SCROLLVIEW
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

struct LoanEligibilitySimulatorLoanDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LoanEligibilitySimulatorLoanDetailsViewModel(manager: MockLoanEligibilitySimulatorManager())
        LoanEligibilitySimulatorLoanDetailsView(viewModel: vm)
    }
}

