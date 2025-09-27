//
//  LoanEligibilitySimulatorView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorPersonalInfoView: View {
    
    //MARK: PROPERTIES
    @StateObject var viewModel: LoanEligibilitySimulatorPersonalInfoViewModel
    
    @State private var age: String = ""
    @State private var employmentStatus: String = ""
    @State private var employmentDuration: String = ""
    @State private var showFinancialInfoView: Bool = false
    @State private var showEmploymentStatusActionSheet: Bool = false
    @State private var employmentStatusOption: String? = nil

    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Navigation Bar
                    NavigationBarView(
                        title1: Constants.NavigationBar.LoanElilitySimulator.title,
                        title2: Constants.NavigationBar.LoanElilitySimulator.personalInfoTitle,
                        stepCount: 2,
                        showStepper: true).padding(.bottom)
                    
                    
                    Group {
                        //Requested Amount
                        TextInputView(title: "Age",
                                      placeholder: "What is your age?",
                                      text: $age,
                                      error: $viewModel.age.error,
                                      keyboardType: .numberPad) 
                        
                        //Loan Term
                        TextInputView(title: "Employment Status",
                                      placeholder: "What is your employment status?",
                                      text: $employmentStatus,
                                      error: $viewModel.employmentStatus.error,
                                      keyboardType: .numberPad)
                        
                        
                        //Loan Purpose
                        TextInputView(title: "Employment Duration",
                                      placeholder: "What is your employment duration?",
                                      text: $employmentDuration,
                                      error: $viewModel.employmentDuration.error,
                                      keyboardType: .numberPad)
                        
                    }//:GROUP
                    
                    PrimaryButton(buttonTitle: "Continue", isDisabled: false) {
                        viewModel.age.value = age
                        viewModel.employmentStatus.value = employmentStatus
                        viewModel.employmentDuration.value = employmentDuration
                        Task {
                            showFinancialInfoView = viewModel.validate()
                        }
                    }//: PrimaryButton
                }//: VSTACK
                .navigationDestination(isPresented: $showFinancialInfoView) {
                    let vm: LoanEligibilitySimulatorFinancialInfoViewModel = IoCContainer.resolve()
                    LoanEligibilitySimulatorFinancialInfoView(viewModel: vm)
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

struct LoanEligibilitySimulatorPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LoanEligibilitySimulatorPersonalInfoViewModel(manager: MockLoanEligibilitySimulatorManager())
        LoanEligibilitySimulatorPersonalInfoView(viewModel: vm)
    }
}
