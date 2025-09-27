//
//  ProductsView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ProductsView: View {
    
    //MARK: PROPERTIES
    @EnvironmentObject private var store: ApplicationStore
    @StateObject var viewModel: ProductsViewModel
    @State private(set) var showFinancialInfoView: Bool = false
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Navigation Bar
                    NavigationBarView(
                        title1: Constants.NavigationBar.ProductOrNeeds.title,
                        title2: Constants.NavigationBar.ProductOrNeeds.productTitle).padding(.bottom)
        
                    //Show the list of products
                    ForEach(store.products, id: \.id) { product in
                        ProductCardView(title: product.name,
                                        caption: product.description,
                                        imageName: product.id,
                                        product: product)
                    }
                    
                    PrimaryButton(buttonTitle: "Continue", isDisabled: viewModel.productSelected) {
                        //Only enable the button once a product has been set
                    }//: PrimaryButton
                }//: VSTACK
                .navigationDestination(isPresented: $showFinancialInfoView) {
                    let vm: LoanEligibilitySimulatorFinancialInfoViewModel = IoCContainer.resolve()
                    LoanEligibilitySimulatorFinancialInfoView(viewModel: vm)
                }
                .onAppear() {
                    Task {
                        viewModel.fetchProducts()
                    }
                }
            }//:SCROLLVIEW
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ProductsViewModel(manager: MockProductsManager())
        ProductsView(viewModel: vm)
    }
}

// MARK: - Mock Manager for Previews
final class MockProductsManager: ProductsManager {
    func fetchProducts() throws -> [Product] {
        //Do nothing
        return []
    }
    
    func saveSelectedProduct(_ product: Product) throws {
        //Do nothing
    }
}
