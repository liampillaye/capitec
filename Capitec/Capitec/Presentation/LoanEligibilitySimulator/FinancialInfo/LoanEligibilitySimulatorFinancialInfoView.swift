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
                        TextInputView(title: "Monthly Income",
                                      placeholder: "What is your monthly income?",
                                      text: $monthlyIncome,
                                      error: $viewModel.monthlyIncome.error,
                                      keyboardType: .numberPad)
                        
                        //Monthly Expenses
                        TextInputView(title: "Monthly Expenses",
                                      placeholder: "What is your monthly expenses?",
                                      text: $monthlyExpenses,
                                      error: $viewModel.monthlyExpenses.error,
                                      keyboardType: .numberPad)
                        
                        //Existing Debt
                        TextInputView(title: "Existing Debt",
                                      placeholder: "How much is your existing debt?",
                                      text: $existingDebt,
                                      error: .constant(.none),
                                      keyboardType: .numberPad)
                        
                        //Credit Score
                        TextInputView(title: "Credit Score",
                                      placeholder: "What is your current credit score?",
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

// MARK: - Mock Manager for Previews
final class MockLoanEligibilitySimulatorManager: LoanEligibilitySimulatorManager {
    func checkEligibility() throws -> Eligibility {
        return Eligibility(
            eligibilityResult: EligibilityResult(
                isEligible: true,
                approvalLikelihood: 85,
                riskCategory: "low",
                decisionReason: "Strong income-to-expense ratio and manageable existing debt"),
            recommendedLoan: RecommendedLoan(
                maxAmount: 180000,
                recommendedAmount: 150000,
                interestRate: 12.5,
                monthlyPayment: 7089.50,
                totalRepayment: 17014800),
            affordabilityAnalysis: AffordabilityAnalysis(
                disposableIncome: 10000.00,
                debtToIncomeRatio: 20.0,
                loanToIncomeRatio: 60.0,
                affordabilityScore: "good"))
    }
    
    func fetchAndSaveValidationRules() throws {
        //TODO
    }
    
    func fetchPersonalInfoValidationRules() throws -> ValidationRulePersonalInfo {
        ValidationRulePersonalInfo(
            age: ValidationRule(
                required: true,
                errorMessage: "Test",
                min: 0,
                max: 0,
                options: nil),
            employmentStatus: ValidationRule(
                required: true,
                errorMessage: "Test",
                min: 0,
                max: 0,
                options: nil),
            employmentDuration: ValidationRule(
                required: true,
                errorMessage: "Test",
                min: 0,
                max: 0,
                options: nil))
    }
    
    func fetchFinancialInfoValidationRules() throws -> ValidationRuleFinancialInfo {
        ValidationRuleFinancialInfo(monthlyIncome: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil), monthlyExpenses: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil), creditScore: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil))
    }
    
    func fetchLoanDetailsValidationRules() throws -> ValidationRuleLoanDetails {
        ValidationRuleLoanDetails(requestedAmount: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil), loanTerm: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil))
    }
    
    func fetchAndSaveValidationRules() async throws {
        //TODO
    }
    
    func calculateRate() throws -> CalculateRate {
        return mockCalculateRate
    }
}
