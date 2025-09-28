//
//  ProductDetailsView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ProductDetailsView: View {
    
    //MARK: PROPERTIES
    var selectedProduct: Product? = nil
    var closeProductDetailsAction: () -> Void
    @State var pulsate: Bool = false
    
    //MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            //Header
            VStack {
                HStack {
                    VStack(alignment: .center) {
                        Image(selectedProduct?.id ?? "")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.bottom)
                    }//:VSTACK
                    VStack(alignment: .leading) {
                        Text(selectedProduct?.name ?? "")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(Color(Constants.Colors.navigationBarTitleColor))
                            .multilineTextAlignment(.leading)
                        Text(selectedProduct?.description ?? "")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(Color(Constants.Colors.navigationBarSubtitleColor))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                    }//:VSTACK
                    .padding()
                    Spacer()
                    VStack {
                        Button(action: {
                            closeProductDetailsAction()
                        }) {
                            Image(systemName: Constants.Images.closeIcon)
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(Constants.Colors.primaryThemeColor))
                                .shadow(radius: 1)
                                .opacity(self.pulsate ? 1 : 0.6)
                                .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsate)
                        }
                    }//:VSTACK
                } //: HSTACK
                .onAppear {
                    pulsate.toggle()
                }
                Divider()
            }//:VSTACK
            .padding(.leading)
            .padding(.trailing)
            
            //Replayment Amounts
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(Constants.Product.Details.minimumAmountTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(selectedProduct?.minAmount ?? 0, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Product.Details.maximumAmountTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(selectedProduct?.maxAmount ?? 0, format: .currency(code: Constants.Product.Details.currencyISOCode))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                Divider()
                
            }//:VSTACK
            .padding()
            
            //Monthly Terms
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(Constants.Product.Details.minimumTermTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text("\(selectedProduct?.minTerm ?? 0) \(Constants.Product.Details.monthsTitle)")
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Product.Details.maxiumTermTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text("\(selectedProduct?.maxTerm ?? 0) \(Constants.Product.Details.monthsTitle)")
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                Divider()

            }//:VSTACK
            .padding()
            
            //Interest Rates
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(Constants.Product.Details.minimumInterestRateTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((selectedProduct?.interestRateRange.min ?? 0)/100, format: .percent.precision(.fractionLength(2)))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                
                HStack {
                    Text(Constants.Product.Details.maximumInterestRateTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text((selectedProduct?.interestRateRange.max ?? 0)/100, format: .percent.precision(.fractionLength(2)))
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(1)
                }//:HSTACK
                Divider()

            }//:VSTACK
            .padding()
            
            //Purposes
            VStack(alignment: .trailing, spacing: 12) {
                HStack {
                    Text(Constants.Product.Details.minimumInterestRateTitle)
                        .font(.system(.caption))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text("\(selectedProduct?.purposes.joined(separator: ",") ?? "") ")
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

//MARK: PREVIEW
#Preview {
    struct Preview: View {
                
        var body: some View {
            ProductDetailsView(selectedProduct: mockProduct) {
                //Close Action
            }
        }
    }
    
    return Preview()
}
