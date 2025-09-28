//
//  CalculateRateCard.swift
//  Capitec
//
//  Created by Liam Pillaye on 2025/09/28.
//

import SwiftUI

struct CalculateRateCard: View {
    //MARK: PROPERTIES
    @State var interestRate: Double = 0.00
    @State var monthlyPayment: Double = 0.00
    @State var totalInterest: Double = 0.00
    @State var totalRepayment: Double = 0.00
    
    //MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            //Navigation Bar
            Text(Constants.CalculateRate.title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                .multilineTextAlignment(.leading)
                .padding()
            
            //Eligibility Results
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    Text(Constants.CalculateRate.interestRateTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(interestRate, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.CalculateRate.monthlyPaymentTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((monthlyPayment)/100, format: .percent.precision(.fractionLength(2)))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.CalculateRate.totalInterestTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(totalInterest, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.CalculateRate.totalRepaymentTitle)
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
    CalculateRateCard()
}
