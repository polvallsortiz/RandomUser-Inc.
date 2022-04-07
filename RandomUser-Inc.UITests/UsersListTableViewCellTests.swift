//
//  UsersListTableViewCellTests.swift
//  RandomUser-Inc.UITests
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import XCTest

class UsersListTableViewCellTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellCreation() throws {
        let app = XCUIApplication()
        app.launch()
        let usersList = app.tables.element(matching: .table, identifier: "usersTableView")
        XCTAssertTrue(usersList.waitForExistence(timeout: 10.0))
        let user1Cell = usersList.cells.element(boundBy: 0)
        XCTAssertTrue(user1Cell.exists)
        let labelCount = user1Cell.staticTexts.count
        XCTAssertEqual(labelCount, 3)
    }
    
}
