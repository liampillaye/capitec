//
//  LoanDetailsViewModelTests.swift
//  CapitecTests
//
//  Created by Liam Pillaye.
//

import XCTest

final class LoanDetailsViewModelTests: XCTestCase {
    
    //MARK: PRIVATES
    private(set) var mockLoanEligibilitySimulatorManager: MockLoanEligibilitySimulatorManager? = nil
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockLoanEligibilitySimulatorManager = MockLoanEligibilitySimulatorManager()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockLoanEligibilitySimulatorManager = nil
        
    }
    
    @MainActor func testValidate() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //Arrange
        let viewModel = LoanEligibilitySimulatorLoanDetailsViewModel(manager: mockLoanEligibilitySimulatorManager!)
        viewModel.requestAmount.value = "5000"
        viewModel.loanTerm.value = "6"
        
        //Act
        let success = viewModel.validate(loanDetails: mockLoanDetails)
        
        //Assert
        XCTAssertTrue(success)
    }
    
    @MainActor func testValidateWithErrors() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //Arrange
        let viewModel = LoanEligibilitySimulatorLoanDetailsViewModel(manager: mockLoanEligibilitySimulatorManager!)
        viewModel.requestAmount.value = "4000"
        viewModel.loanTerm.value = "1"
        
        //Act
        let success = viewModel.validate(loanDetails: mockLoanDetails)
        
        //Assert
        XCTAssertFalse(success)
        XCTAssertNotNil(viewModel.requestAmount.error)
        XCTAssertNotNil(viewModel.loanTerm.error)
    }
}
