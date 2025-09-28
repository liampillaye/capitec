//
//  LoanEligibilitySimulatorFinancialInfoView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorFinancialInfoView: View {
        
    //MARK: PROPERTIES
    @StateObject var viewModel: LoanEligibilitySimulatorFinancialInfoViewModel
    @State private var monthlyIncome: String = ""
    @State private var monthlyExpenses: String = ""
    @State private var existingDebt: String = ""
    @State private var creditScore: String = ""
    @State private var showEligiblityView: Bool = false
    
        
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Navigation Bar
                    NavigationBarView(
                        title1: Constants.NavigationBar.LoanElilitySimulator.title,
                        title2: Constants.NavigationBar.LoanElilitySimulator.financialInfoTitle,
                        stepCount: 3,
                        showStepper: true).padding(.bottom)
                    
                    
                    Group {
                        //Monthly Income
                        TextInputView(title: Constants.FinancialInfo.monthlyIncomeTitle,
                                      placeholder: Constants.FinancialInfo.monthlyIncomePlaceholder,
                                      text: $monthlyIncome,
                                      error: $viewModel.monthlyIncome.error,
                                      keyboardType: .numberPad)
                        
                        //Monthly Expenses
                        TextInputView(title: Constants.FinancialInfo.monthlyExpensesTitle,
                                      placeholder: Constants.FinancialInfo.monthlyExpensesPlaceholder,
                                      text: $monthlyExpenses,
                                      error: $viewModel.monthlyExpenses.error,
                                      keyboardType: .numberPad)
                        
                        //Existing Debt
                        TextInputView(title: Constants.FinancialInfo.existingDebtTitle,
                                      placeholder: Constants.FinancialInfo.existingDebtPlaceholder,
                                      text: $existingDebt,
                                      error: .constant(.none),
                                      keyboardType: .numberPad)
                        
                        //Credit Score
                        TextInputView(title: Constants.FinancialInfo.creditScoreTitle,
                                      placeholder: Constants.FinancialInfo.creditScorePlaceholder,
                                      text: $creditScore,
                                      error: $viewModel.creditScore.error,
                                      keyboardType: .numberPad)
                    }//:GROUP
                    
                    
                    Spacer()
                    
                    PrimaryButton(buttonTitle: "Eligibility Check", isDisabled: false) {
                        viewModel.monthlyIncome.value = monthlyIncome
                        viewModel.monthlyExpenses.value = monthlyExpenses
                        viewModel.creditScore.value = creditScore
                        if viewModel.validate(financialInfo: FinancialInfo(
                            monthlyIncome: Int(monthlyIncome) ?? 0,
                            monthlyExpenses: Int(monthlyExpenses) ?? 0,
                            existingDebt: Int(existingDebt) ?? 0,
                            creditScore: Int(creditScore) ?? 0)) {
                            Task {
                                if try viewModel.checkEligibility() {
                                   showEligiblityView = try viewModel.calculateRate()
                                }
                            }
                        }
                    }
                }//: VSTACK
                .navigationDestination(isPresented: $showEligiblityView) {
                    let vm: EligibilityViewModel = IoCContainer.resolve()
                    EligibilityView(viewModel: vm)
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

struct LoanEligibilitySimulatorFinancialInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LoanEligibilitySimulatorFinancialInfoViewModel(manager: MockLoanEligibilitySimulatorManager())
        LoanEligibilitySimulatorFinancialInfoView(viewModel: vm)
    }
}
