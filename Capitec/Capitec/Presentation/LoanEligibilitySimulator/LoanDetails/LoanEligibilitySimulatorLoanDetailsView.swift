//
//  LoanEligibilitySimulatorLoanDetailsView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorLoanDetailsView: View {
    
    
    //MARK: PROPERTIES
    @EnvironmentObject var store: ApplicationStore
    @StateObject var viewModel: LoanEligibilitySimulatorLoanDetailsViewModel
    @State private var requestedAmount: String = ""
    @State private var loanTerm: String = ""
    @State private var loanPurpose: String = ""
    @State private var showPersonalInfoView: Bool = false
    
    
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
                        TextInputView(title: Constants.LoanDetails.requestAmountTitle,
                                      placeholder: Constants.LoanDetails.requestAmountPlaceholder ,
                                      text: $requestedAmount,
                                      error: $viewModel.requestAmount.error,
                                      keyboardType: .numberPad)
                        
                        //Loan Term
                        TextInputView(title: Constants.LoanDetails.loanTermTitle,
                                      placeholder: Constants.LoanDetails.loanTermPlacholder,
                                      text: $loanTerm,
                                      error: $viewModel.loanTerm.error,
                                      keyboardType: .numberPad)
                        
                        //Loan Purpose
                        TextInputView(title: Constants.LoanDetails.loanTermTitle,
                                      placeholder: Constants.LoanDetails.loanPurposePlaceholder,
                                      text: $loanPurpose,
                                      error: .constant(.none),
                                      keyboardType: .numberPad)
                        
                    }//:GROUP
                    
                    Spacer()
                    
                    PrimaryButton(buttonTitle: "Continue", isDisabled: false) {
                        viewModel.requestAmount.value = requestedAmount
                        viewModel.loanTerm.value = loanTerm
                        showPersonalInfoView = viewModel.validate(loanDetails:
                                                                    LoanDetails(requestedAmount: Int(requestedAmount) ?? 0,
                                                                                loanTerm: Int(loanTerm) ?? 0,
                                                                                loanPurpose: store.selectedProduct?.id ?? ""))
                    }
                }//: VSTACK
                .navigationDestination(isPresented: $showPersonalInfoView) {
                    let viewModel: LoanEligibilitySimulatorPersonalInfoViewModel = IoCContainer.resolve()
                    LoanEligibilitySimulatorPersonalInfoView(viewModel: viewModel)
                }
                .onAppear() {
                    Task {
                        try viewModel.fetchValidationRules()
                    }
                    
                    guard let selectedProduct = store.selectedProduct else {
                        //Do nothing
                        return
                    }
                    
                    loanPurpose = selectedProduct.name
                }
            }//:SCROLLVIEW
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

//MARK: PREVIEW
#Preview {
    
    struct Preview: View {
        
        let store: ApplicationStore = ApplicationStore.instance
        let vm = LoanEligibilitySimulatorLoanDetailsViewModel(manager: MockLoanEligibilitySimulatorManager())

        var body: some View {
            LoanEligibilitySimulatorLoanDetailsView(viewModel: vm)
                .environmentObject(ApplicationStore.instance)
        }
    }
    
    return Preview()
}


