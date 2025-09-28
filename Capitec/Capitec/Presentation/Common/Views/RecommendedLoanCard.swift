//
//  RecommendedLoanCard.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct RecommendedLoanCard: View {
    //MARK: PROPERTIES
    @State var maxAmount: Double = 0.00
    @State var recommendedAmount: Double = 0.00
    @State var interestRate: Double = 0.00
    @State var monthlyPayment: Double = 0.00
    @State var totalRepayment: Double = 0.00
    
    //MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            //Navigation Bar
            Text(Constants.Eligibility.RecommendedLoan.title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                .multilineTextAlignment(.leading)
                .padding()
            
            //Eligibility Results
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(Constants.Eligibility.RecommendedLoan.maxAmountTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(maxAmount, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.RecommendedLoan.recommendedAmountTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(recommendedAmount, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.RecommendedLoan.interestRateTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((interestRate)/100, format: .percent.precision(.fractionLength(2)))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.RecommendedLoan.monthlyPaymentTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(monthlyPayment, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.RecommendedLoan.totalRepaymentTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(totalRepayment, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
            }//:VSTACK
            .padding()
        }//:VSTACK
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color(Constants.Colors.dropShadowColor), radius: 8, x: 0, y: 0)
        .padding()
    }//:BODY
}

#Preview {
    RecommendedLoanCard()
}
