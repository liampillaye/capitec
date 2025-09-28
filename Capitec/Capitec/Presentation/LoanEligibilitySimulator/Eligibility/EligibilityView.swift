//
//  EligibilityView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct EligibilityView: View {
    
    //MARK: PROPERTIES
    @EnvironmentObject private var store: ApplicationStore
    @StateObject var viewModel: EligibilityViewModel
    @State private var selectedSegment: String = Constants.SegmentedControl.eligiblityTag
    @State private var resetEligibility: Bool = false
    @State private var showProductView: Bool = false

    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(Constants.NavigationBar.Eligibility.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                    .multilineTextAlignment(.leading)
                
                Picker("Options", selection: $selectedSegment) {
                    Text(Constants.SegmentedControl.eligiblityTitle).tag(Constants.SegmentedControl.eligiblityTag)
                    Text(Constants.SegmentedControl.calculateRateTitle).tag(Constants.SegmentedControl.calculateTag)
                }.pickerStyle(.segmented)
                    .padding()
                                
                if selectedSegment == "eligibility" {
                    EligibilityResultCard(isEligible: store.eligibility?.eligibilityResult.isEligible ?? false,
                                          approvalLikelihood: store.eligibility?.eligibilityResult.approvalLikelihood ?? 0,
                                          riskCategory: store.eligibility?.eligibilityResult.riskCategory ?? "unknown",
                                          decisionReason: store.eligibility?.eligibilityResult.decisionReason ?? "")
                    
                    RecommendedLoanCard(maxAmount: store.eligibility?.recommendedLoan.maxAmount ?? 0.00,
                                        recommendedAmount: store.eligibility?.recommendedLoan.recommendedAmount ?? 0.00,
                                        interestRate: store.eligibility?.recommendedLoan.interestRate ?? 0.00,
                                        monthlyPayment: store.eligibility?.recommendedLoan.interestRate ?? 0.00,
                                        totalRepayment: store.eligibility?.recommendedLoan.totalRepayment ?? 0.00)
                        
                    AffordabilityAnalysisCard(disposableIncome: store.eligibility?.affordabilityAnalysis.disposableIncome ?? 0.00,
                                              debtToIncomeRatio: store.eligibility?.affordabilityAnalysis.debtToIncomeRatio ?? 0.00,
                                              loanToIncomeRatio: store.eligibility?.affordabilityAnalysis.loanToIncomeRatio ?? 0.00,
                                              affordabilityScore: store.eligibility?.affordabilityAnalysis.affordabilityScore ?? "")
                } else {
                    
                    CalculateRateCard(
                        interestRate: store.calculateRate?.interestRate ?? 0.00,
                        monthlyPayment: store.calculateRate?.monthlyPayment ?? 0.00,
                        totalInterest: store.calculateRate?.interestRate ?? 0.00,
                        totalRepayment: store.calculateRate?.totalRepayment ?? 0.00)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        //Navigation Bar
                        Text(Constants.CalculateRate.PaymentSchedule.title)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        ForEach(store.paymentSchedule, id: \.id) { payment in
                            Divider()
                                .padding()
                            MonthlyPaymentCard(
                                month: payment.month,
                                payment: payment.payment,
                                principle: payment.principal,
                                interest: payment.interest,
                                balance: payment.balance)
                        }//:FOREACH
                    }//:VSTACK
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color(Constants.Colors.dropShadowColor), radius: 8, x: 0, y: 0)
                    .padding()
                    
                }
                
                PrimaryButton(buttonTitle: Constants.ResetAlert.resetPrimaryButtonTitle, isDisabled: false, buttonAction: {
                    resetEligibility = true
                })
                .alert(Constants.ResetAlert.title, isPresented: $resetEligibility) {
                    Button(Constants.ResetAlert.yesButtonTitle) {
                        showProductView = true
                    }
                    
                    Button(Constants.ResetAlert.noButtonTitle) {
                        resetEligibility = false
                    }
                } message: {
                    Text(Constants.ResetAlert.message)
                }
                .navigationDestination(isPresented: $showProductView) {
                    let viewModel: ProductsViewModel = IoCContainer.resolve()
                    ProductsView(viewModel: viewModel)
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
        
        let vm = EligibilityViewModel(manager: MockLoanEligibilitySimulatorManager())

        var body: some View {
            EligibilityView(viewModel: vm)
                .environmentObject(ApplicationStore.instance)
        }
    }
    
    return Preview()
}

