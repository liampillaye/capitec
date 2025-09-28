//
//  EligibilityResultCard.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct EligibilityResultCard: View {
    
    //MARK: PROPERTIES
    @State var isEligible: Bool = false
    @State var approvalLikelihood: Int = 0
    @State var riskCategory: String = ""
    @State var decisionReason: String = ""
    
    //MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            //Navigation Bar
            Text(Constants.Eligibility.Results.resultTitle)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                .multilineTextAlignment(.leading)
                .padding()
            
            //Eligibility Results
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(Constants.Eligibility.Results.isEligibleTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(isEligible ? "True" : "False" )
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.Results.approvalLikelihoodTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((Decimal(approvalLikelihood))/100, format: .percent.precision(.fractionLength(2)))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.Results.riskCategoryTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    if riskCategory.lowercased() == "low" {
                        Text(riskCategory)
                            .font(.system(.caption))
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .lineLimit(1)
                    } else {
                        Text(riskCategory)
                            .font(.system(.caption))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .lineLimit(1)
                        
                    }
                }//:HSTACK
                
                HStack {
                    Text(Constants.Eligibility.Results.decisionReasonTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(decisionReason)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(3)
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
    
    struct Preview: View {
        
        var body: some View {
            EligibilityResultCard(isEligible: true,
                                  approvalLikelihood: 85,
                                  riskCategory: "high",
                                  decisionReason: "Strong income-to-expense ratio and manageable existing debt")
        }
    }
    
    return Preview()
}
