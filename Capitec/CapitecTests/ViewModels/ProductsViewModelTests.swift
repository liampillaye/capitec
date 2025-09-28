//
//  ProductsViewModelTests.swift
//  CapitecTests
//
//  Created by Liam Pillaye.
//

import XCTest

final class ProductsViewModelTests: XCTestCase {
    
    //MARK: PRIVATES
    private(set) var mockProductsManager: MockProductsManager? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockProductsManager = MockProductsManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockProductsManager = nil
        
    }

    @MainActor func testFetchProducts() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //Arrange
        let viewModel = ProductsViewModel(manager: mockProductsManager!)
        
        //Act
        viewModel.fetchProducts()
        
        //Assert
        XCTAssertTrue(viewModel.products.count > 0)
    }
    
    @MainActor func testSelectProduct() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //Arrange
        let viewModel = ProductsViewModel(manager: MockProductsManager())
        
        //Act
        viewModel.selectProduct(product: mockProduct)
        
        //Assert
        XCTAssertTrue(viewModel.productSelected)
    }
}
