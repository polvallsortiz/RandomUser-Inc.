//
//  UserDetailViewControllerUITests.swift
//  RandomUser-Inc.UITests
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import XCTest

class UserDetailViewControllerUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserDetailCreation() {
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
        let mapViewCount = userDetail.maps.count
        XCTAssertEqual(mapViewCount, 1)
        let imageViewCount = userDetail.images.count
        XCTAssertEqual(imageViewCount, 4)
        let labelsCount = userDetail.staticTexts.count
        XCTAssertEqual(labelsCount, 8)
    }
    
    func testDetailNavigatesBack() {
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
        userDetail.swipeDown(velocity: .fast)
        let exists = userDetail.exists
        XCTAssertFalse(exists)
    }
}
