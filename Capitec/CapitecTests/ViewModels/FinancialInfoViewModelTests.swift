//
//  FinancialInfoViewModelTests.swift
//  CapitecTests
//
//  Created by Liam Pillaye.
//

import XCTest

final class FinancialInfoViewModelTests: XCTestCase {
    
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
        let viewModel = LoanEligibilitySimulatorFinancialInfoViewModel(manager: mockLoanEligibilitySimulatorManager!)
        viewModel.monthlyIncome.value = "5000"
        viewModel.monthlyExpenses.value = "1"
        viewModel.creditScore.value = "350"
        
        //Act
        let success = viewModel.validate(financialInfo: mockFinancialInfo)
        
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
        let viewModel = LoanEligibilitySimulatorFinancialInfoViewModel(manager: mockLoanEligibilitySimulatorManager!)
        viewModel.monthlyIncome.value = "1"
        viewModel.monthlyExpenses.value = ""
        viewModel.creditScore.value = "0"
        
        //Act
        let success = viewModel.validate(financialInfo: mockFinancialInfo)
        
        //Assert
        XCTAssertFalse(success)
        XCTAssertNotNil(viewModel.monthlyIncome.error)
        XCTAssertNotNil(viewModel.monthlyExpenses.error)
        XCTAssertNil(viewModel.creditScore.error)
    }
    
    @MainActor func testValidateWithCreditScoreValidationNotRequired() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //Arrange
        let viewModel = LoanEligibilitySimulatorFinancialInfoViewModel(manager: mockLoanEligibilitySimulatorManager!)
        viewModel.monthlyIncome.value = "5000"
        viewModel.monthlyExpenses.value = "1"
        viewModel.creditScore.value = "0" //INVALID
        
        //Act
        let success = viewModel.validate(financialInfo: mockFinancialInfo)
        
        //Assert
        XCTAssertTrue(success)
        XCTAssertNil(viewModel.creditScore.error)
    }
    
    @MainActor func testCheckEligibility() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //Arrange
        let viewModel = LoanEligibilitySimulatorFinancialInfoViewModel(manager: mockLoanEligibilitySimulatorManager!)
        
        //Act
        let success = try viewModel.checkEligibility()
        
        //Assert
        XCTAssertTrue(success)
    }
    
    @MainActor func testCalculateRate() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //Arrange
        let viewModel = LoanEligibilitySimulatorFinancialInfoViewModel(manager: mockLoanEligibilitySimulatorManager!)
        
        //Act
        let success = try viewModel.calculateRate()
        
        //Assert
        XCTAssertTrue(success)
    }
}
