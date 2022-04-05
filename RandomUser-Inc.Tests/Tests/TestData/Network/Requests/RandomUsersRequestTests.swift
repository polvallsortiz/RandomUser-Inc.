//
//  RandomUsersRequestTests.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import XCTest

class RandomUsersRequestTests: XCTestCase {

    var randomUsersRequest: RandomUsersRequest!

    override func setUp() {
        randomUsersRequest = RandomUsersRequest(usersToLoad: 20, seed: "testseed", page: 2)
    }

    func testGetParameters() {
        let parameters = randomUsersRequest.getParameters()
        XCTAssertEqual(parameters["results"] as! Int, 20)
        XCTAssertEqual(parameters["inc"] as! String, "name,gender,location,email,phone,registered,picture,id")
        XCTAssertEqual(parameters["seed"] as! String, "testseed")
        XCTAssertEqual(parameters["page"] as! Int, 2)
    }

}
