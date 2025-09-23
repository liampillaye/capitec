//
//  MockDataServiceTests.swift
//  CapitecTests
//
//  Created by Liam Pillaye on 2025/09/23.
//

import XCTest

final class MockDataServiceTests: XCTestCase {
    
    //MARK: PRIVATES
    private(set) var mockDataService: MockDataService? = nil
    private(set) var store: ApplicationStore? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockDataService = MockDataService.shared
        store = ApplicationStore.instance
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockDataService = nil
    }

    func testMockBranchesServiceLoaded() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        mockDataService?.loadDataFromBundle("MockBranches.json")
        
        
        XCTAssertNotNil(store?.branches)
        XCTAssertGreaterThan(store?.branches?.count ?? 0, 0)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
