//
//  UsersListViewControllerUITests.swift
//  RandomUser-Inc.UITests
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import XCTest

class UsersListViewControllerUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }
    
    func testUsersTableCreationWithRows() throws {
        let app = XCUIApplication()
        app.launch()
        let usersList = app.tables.element(matching: .table, identifier: "usersTableView")
        XCTAssertTrue(usersList.waitForExistence(timeout: 5.0))
        let usersRows = usersList.cells
        XCTAssertGreaterThan(usersRows.count, 0)
    }
    
    func testUserTableCellsNavigate() throws {
        let app = XCUIApplication()
        app.launch()
        let usersList = app.tables.element(matching: .table, identifier: "usersTableView")
        XCTAssertTrue(usersList.waitForExistence(timeout: 5.0))
        let usersRows = usersList.cells
        XCTAssertGreaterThan(usersRows.count, 0)
        let firstRow = usersRows.element(boundBy: 0)
        firstRow.tap()
        let userDetail = app.otherElements["userDetailView"]
        XCTAssertTrue(userDetail.waitForExistence(timeout: 1.0))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
