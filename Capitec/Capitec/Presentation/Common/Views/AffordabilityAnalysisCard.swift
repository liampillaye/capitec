//
//  AffordabilityAnalysis.swift
//  Capitec
//
//  Created by Liam Pillaye on 2025/09/28.
//

import SwiftUI

struct AffordabilityAnalysisCard: View {
    //MARK: PROPERTIES
    @State var disposableIncome: Double = 0.00
    @State var debtToIncomeRatio: Double = 0.00
    @State var loanToIncomeRatio: Double = 0.00
    @State var affordabilityScore: String = ""
    
    //MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            //Navigation Bar
            Text(Constants.Eligibility.AffordabilityAnalysis.title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                .multilineTextAlignment(.leading)
                .padding()
            
            //Eligibility Results
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(Constants.Eligibility.AffordabilityAnalysis.disposableIncomeTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(disposableIncome, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.AffordabilityAnalysis.debtToIncomeRatioTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((debtToIncomeRatio)/100, format: .percent.precision(.fractionLength(2)))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.AffordabilityAnalysis.loanToIncomeRatioTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((loanToIncomeRatio)/100, format: .percent.precision(.fractionLength(2)))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.AffordabilityAnalysis.affordabilityScoreTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    if affordabilityScore.lowercased() == "good" {
                        Text(affordabilityScore)
                            .font(.system(.caption))
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .lineLimit(1)
                    } else {
                        Text(affordabilityScore)
                            .font(.system(.caption))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .lineLimit(1)
                    }
                    
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
    AffordabilityAnalysisCard()
}
