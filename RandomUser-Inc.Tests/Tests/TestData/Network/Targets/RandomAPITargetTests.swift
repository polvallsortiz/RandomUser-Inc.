//
//  RandomAPITargetTests.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import XCTest
import Moya

class RandomAPITargetTests: XCTestCase {

    var randomAPITarget: RandomAPITarget!
    var randomAPITarget2: RandomAPITarget!

    override func setUp() {
        MockDependencyInjection.mockDependencies()
        randomAPITarget = RandomAPITarget.randomUsers(request: MockRandomUsersRequest.getMockRandomUsersRequestComplete())
        randomAPITarget2 = RandomAPITarget.randomUsers(request: MockRandomUsersRequest.getMockRandomUsersRequestIncomplete())
    }

    func testBaseURL() {
        let url1 = randomAPITarget.baseURL
        let url2 = randomAPITarget2.baseURL
        XCTAssertEqual(url1.absoluteString, "https://randomuser.me/API")
        XCTAssertEqual(url2.absoluteString, "https://randomuser.me/API")
    }

    func testPath() {
        let path = randomAPITarget.path
        XCTAssertEqual(path, "/")
    }

    func testMethod() {
        let method = randomAPITarget.method
        XCTAssertEqual(method.rawValue, "GET")
    }

    func testHeaders() {
        let headers = randomAPITarget.headers
        XCTAssertEqual(headers?["Accept"], "application/json")
        XCTAssertEqual(headers?["Content-Type"], "application/json")
    }

}
