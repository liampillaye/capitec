//
//  MonthlyPaymentCard.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct MonthlyPaymentCard: View {
    //MARK: PROPERTIES
    @State var month: Int = 0
    @State var payment: Double = 0.00
    @State var principle: Double = 0.00
    @State var interest: Double = 0.00
    @State var balance: Double = 0.00
    
    //MARK: BODY
    var body: some View {            
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                Text(Constants.CalculateRate.PaymentSchedule.monthTitle)
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(2)
                
                Spacer()
                
                Text("\(month)")
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }//:HSTACK
            
            HStack {
                Text(Constants.CalculateRate.PaymentSchedule.paymentTitle)
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(2)
                
                Spacer()
                
                Text(payment, format: .currency(code: Constants.Product.Details.currencyISOCode))
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }//:HSTACK
            
            HStack {
                Text(Constants.CalculateRate.PaymentSchedule.principleTitle)
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(2)
                
                Spacer()
                
                Text(payment, format: .currency(code: Constants.Product.Details.currencyISOCode))
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }//:HSTACK
            
            HStack {
                Text(Constants.CalculateRate.PaymentSchedule.interestTitle)
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(2)
                
                Spacer()
                
                Text(interest, format: .currency(code: Constants.Product.Details.currencyISOCode))
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }//:HSTACK
            
            HStack {
                Text(Constants.CalculateRate.PaymentSchedule.balanceTitle)
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(2)
                
                Spacer()
                
                Text(balance, format: .currency(code: Constants.Product.Details.currencyISOCode))
                    .font(.system(.caption))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }//:HSTACK
            
        }//:VSTACK
        .padding()
    }//:BODY
}

#Preview {
    MonthlyPaymentCard()
}
