//
//  UsersListHeaderViewUITests.swift
//  RandomUser-Inc.UITests
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import XCTest

class UsersListHeaderViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
    }
    
    func testSearchBar() throws {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.navigationBars["Random Users"].buttons["Search"]
        let searchBar = app.tables.searchFields["Search users by name, surname, email"]
        XCTAssertTrue(searchButton.waitForExistence(timeout: 5.0))
        searchButton.tap()
        XCTAssertTrue(searchBar.waitForExistence(timeout: 1.0))
        XCTAssertEqual(searchBar.placeholderValue, "Search users by name, surname, email")
    }
    
    func testSearchBarChangesList() throws {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.navigationBars["Random Users"].buttons["Search"]
        let searchBar = app.tables.searchFields["Search users by name, surname, email"]
        XCTAssertTrue(searchButton.waitForExistence(timeout: 5.0))
        searchButton.tap()
        XCTAssertTrue(searchBar.waitForExistence(timeout: 1.0))
        let usersList = app.tables.element(matching: .table, identifier: "usersTableView")
        let usersCount = usersList.cells.count
        searchBar.tap()
        searchBar.typeText("pr")
        app/*@START_MENU_TOKEN@*/.buttons["buscar"]/*[[".keyboards",".buttons[\"buscar\"]",".buttons[\"Search\"]"],[[[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(1)
        let usersCountAfter = usersList.cells.count
        XCTAssertLessThan(usersCountAfter, usersCount)
    }

}
