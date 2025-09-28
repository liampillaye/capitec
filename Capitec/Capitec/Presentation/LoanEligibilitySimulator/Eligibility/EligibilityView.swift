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
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(Constants.NavigationBar.Eligibility.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                    .multilineTextAlignment(.leading)
                
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



                .onAppear() {
                    Task {
                    }
                }
            }//:SCROLLVIEW
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

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

