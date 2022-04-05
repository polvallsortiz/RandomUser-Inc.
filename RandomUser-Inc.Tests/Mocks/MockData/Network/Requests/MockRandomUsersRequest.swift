//
//  MockRandomUsersRequest.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import Foundation

class MockRandomUsersRequest {

    static func getMockRandomUsersRequestIncomplete() -> RandomUsersRequest {
        return RandomUsersRequest(usersToLoad: 20)
    }

    static func getMockRandomUsersRequestComplete() -> RandomUsersRequest {
        return RandomUsersRequest(usersToLoad: 20, seed: "testseed", page: 1)
    }

}
