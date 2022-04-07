//
//  SplashViewUITests.swift
//  RandomUser-Inc.UITests
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import XCTest

class SplashViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSplashScreenCreation() throws {
        let app = XCUIApplication()
        app.launch()
        let splashView = app.otherElements["splashView"]
        XCTAssertTrue(splashView.waitForExistence(timeout: 5))
    }
    
}
