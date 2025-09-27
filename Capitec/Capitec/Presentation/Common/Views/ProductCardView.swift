//
//  ProductCard.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ProductCardView: View {
    
    //MARK: PROPERTIES
    var title: String
    var caption: String
    var imageName: String
    var product: Product
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .center) {
                    Image(self.imageName)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.bottom)
                }//:VSTACK
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                        .multilineTextAlignment(.leading)
                    Text(caption)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color(Constants.Colors.navigationBarSubtitleColor))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20)
                    
                }//:VSTACK
                Spacer()
                VStack {
                    Button(action: {
                        print("accessory disclosure selected: \(product.name)")
                    }) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .background(.white)
                            .foregroundColor(Color(Constants.Colors.primaryThemeColor))
                            .cornerRadius(15)
                            .padding(.leading)
                            .padding(.bottom)
                        
                    }
                }
            } //: HSTACK
            //DIVIDER
            Divider()
                .background(Color(Constants.Colors.textBoarderColor))
            
        }//: VSTACK
        .padding(20)
        
    }
}

#Preview {
    ProductCardView(title: "Personal Loan", caption: "Flexible personal financing for various needs", imageName: Constants.Images.personalLoan, product: Product(
        id: "personal_loan",
        name: "Personal Loan",
        description: "Flexible personal financing for various needs",
        minAmount: 5000,
        maxAmount: 300000,
        minTerm: 6,
        maxTerm: 60,
        interestRateRange: InterestRateRange(min: 8.5, max: 15.0),
        purposes: ["debt_consolidation", "home_improvement", "education", "medical", "other"]))
}
