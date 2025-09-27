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
                                        product: product).onTapGesture {
                            viewModel.selectProduct(product: product)
                        }
                    }
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
                .onReceive(viewModel.$productSelected) {
                    if $0 {
                        showFinancialInfoView = $0
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
