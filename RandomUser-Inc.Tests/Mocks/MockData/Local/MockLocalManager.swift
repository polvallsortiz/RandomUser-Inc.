//
//  MockLocalManager.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

@testable import RandomUser_Inc_
import Foundation

class MockLocalManagerImplementation: LocalManager {

    var saveRandomUserResponseCalled: Bool = false
    func saveRandomUsersResponse(_ response: UserResponse) {
        saveRandomUserResponseCalled = true
    }

    var getRandomUsersResponseCalled: Bool = false
    func getRandomUsersResponse(page: Int?) -> UserResponse? {
        getRandomUsersResponseCalled = true
        return page != 0 ? MockUserResponse.getMockUserResponse() : nil
    }

    var getNextRandomUsersPageCalled: Bool = false
    func getNextRandomUsersPage() -> Int? {
        getNextRandomUsersPageCalled = true
        return 2
    }

}
