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
    
    //MARK: PRIVATE FUNCTIONS
    @discardableResult private func estimateAction() -> Bool {
        return viewModel.validate()
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
                                  error: $viewModel.age.error,
                                  keyboardType: .numberPad)
                    
                    //Expenses
                    TextInputView(title: "Employment Status",
                                  placeholder: "What is your employment status?",
                                  text: $employmentStatus,
                                  error: $viewModel.employmentStatus.error,
                                  keyboardType: .numberPad)
                    
                    //LoanAmount
                    TextInputView(title: "Employment Duration",
                                  placeholder: "How long have you been employed?",
                                  text: $employmentDuration,
                                  error: $viewModel.employmentDuration.error,
                                  keyboardType: .numberPad)
                    
                    Spacer()
                    
                    PrimaryButton(buttonTitle: "Continue", isDisabled: false) {
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

struct LoanEligibilitySimulatorPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LoanEligibilitySimulatorPersonalInfoViewModel(manager: MockLoanEligibilitySimulatorManager())
        LoanEligibilitySimulatorPersonalInfoView(viewModel: vm)
    }
}

// MARK: - Mock Manager for Previews
final class MockLoanEligibilitySimulatorManager: LoanEligibilitySimulatorManager {
    func fetchAndSaveValidationRules() async throws {
        //TODO
    }
}
