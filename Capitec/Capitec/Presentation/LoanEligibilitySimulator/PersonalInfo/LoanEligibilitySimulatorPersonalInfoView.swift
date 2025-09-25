//
//  LoanEligibilitySimulatorView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorPersonalInfoView: View {
    
    //MARK: PROPERTIES
    @ObservedObject var viewModel: LoanEligibilitySimulatorPersonalInfoViewModel
        
    @State private var age: String = ""
    @State private var employmentStatus: String = ""
    @State private var employmentDuration: String = ""
    @State private var showFinancialInfoView: Bool = false
        
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Navigation Bar
                    NavigationBarView(
                        title1: Constants.NavigationBar.LoanElilitySimulator.title,
                        title2: Constants.NavigationBar.LoanElilitySimulator.personalInfoTitle,
                        stepCount: 1,
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
                        if viewModel.validate() {
                            print("validation passed, no errors continue")
                        } else {
                            print("valdation failed.")
                        }
                    }
                }//: VSTACK
                .navigationDestination(isPresented: $showFinancialInfoView) {
                    //                OnboardingClientView()
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

// MARK: - Mock Manager for Previews
final class MockLoanEligibilitySimulatorManager: LoanEligibilitySimulatorManager {
    func fetchAndSaveValidationRules() throws {
        //TODO
    }
    
    func fetchPersonalInfoValidationRules() throws -> ValidationRulePersonalInfo {
        ValidationRulePersonalInfo(age: ValidationRule(min: 0, max: nil, required: true, errorMessage: "Hello"), employmentStatus: ValidationRuleEmploymentStatus(employmentStatusRequired: true, options: ["test"], errorMessage: "test"), employmentDuration: ValidationRule(min: 0, max: nil, required: false, errorMessage: "Hello"))
    }
    
    func fetchAndSaveValidationRules() async throws {
        //TODO
    }
}
