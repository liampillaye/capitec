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
    @State private(set) var showLoanDetailsView: Bool = false
    @State private(set) var showProductListView: Bool = true
    @State private(set) var product: Product? = nil
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //Navigation Bar
                    NavigationBarView(
                        title1: Constants.NavigationBar.ProductOrNeeds.title,
                        title2: Constants.NavigationBar.ProductOrNeeds.productTitle).padding(.bottom)
        
                    //Product List
                    if showProductListView {
                        ForEach(store.products, id: \.id) { product in
                            ProductCardView(title: product.name,
                                            caption: product.description,
                                            imageName: product.id,
                                            product: product, accessoryDisclosureAction: { product in
                                showProductListView = false
                                self.product = product
                            }).onTapGesture {
                                viewModel.selectProduct(product: product)
                            }
                        }
                    } else {
                        ProductDetailsView(selectedProduct: self.product) {
                            showProductListView = true
                        }
                    }
                }//: VSTACK
                .navigationDestination(isPresented: $showLoanDetailsView) {
                    let vm: LoanEligibilitySimulatorLoanDetailsViewModel = IoCContainer.resolve()
                    LoanEligibilitySimulatorLoanDetailsView(viewModel: vm)
                }
                .onAppear() {
                    Task {
                        viewModel.fetchProducts()
                    }
                }
                .onReceive(viewModel.$productSelected) {
                    if $0 {
                        showLoanDetailsView = $0
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
        let vm = ProductsViewModel(manager: MockProductsManager())

        var body: some View {
            ProductsView(viewModel: vm)
                .environmentObject(ApplicationStore.instance)
        }
    }
    
    return Preview()
}

// MARK: - Mock Manager for Previews
final class MockProductsManager: ProductsManager {
    func fetchProducts() throws -> [Product] {
        //Do nothing
        return []
    }
    
    func saveSelectedProduct(_ product: Product) {
        //Do nothing
    }
}
