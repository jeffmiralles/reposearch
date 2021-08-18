//
//  ItemStructTests.swift
//  Repo3Tests
//
//  Created by Jefferson Miralles on 8/15/21.
//

import XCTest
@testable import Repo3

class ItemStructTests: XCTestCase {

    override func setUp(){
		super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
    }
	
	func testInit_NotNil() {
		let item = Item(id: 1, fullname: "Apple/Swift")
		XCTAssertNotNil(item)
	}

}
