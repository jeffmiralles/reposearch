//
//  RepoViewModelTests.swift
//  Repo3Tests
//
//  Created by Jefferson Miralles on 8/15/21.
//

import XCTest
@testable import Repo3

class RepoViewModelTests: XCTestCase {
	
	var sut: RepoViewModel!
	var mockRepoRepositories: RepoRepositoriesProtocol!

    override func setUp() {
		super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		mockRepoRepositories = MockRepoRepositories()
		sut = RepoViewModel(repository: mockRepoRepositories)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
    }
	
	func testInit_Items_Exist() {
		XCTAssertNotNil(sut.items)
	}
	
	func testItems_Count_ReturnZero() {
		XCTAssertEqual(sut.items.count, 0)
	}
	
	func testSearch_ReturnNonEmptyItems() {
		XCTAssertTrue(sut.items.isEmpty)
		let expectation = XCTestExpectation(description: "Items must not be empty")
		
		sut.search(query: "test") { result in
			if (result == nil && !self.sut.items.isEmpty) {
				expectation.fulfill()
			}
		}
		
		let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
		XCTAssertEqual(result, .completed)
	}

}
