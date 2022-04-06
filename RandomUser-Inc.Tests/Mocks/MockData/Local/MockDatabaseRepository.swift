//
//  MockDatabaseRepository.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

@testable import RandomUser_Inc_
import Foundation

class MockDatabaseRepositoryImplementation: DatabaseRepository {

    var saveRandomUserResponseCalled: Bool = false
    func saveRandomUsersResponse(_ response: UserResponse) {
        saveRandomUserResponseCalled = true
    }

    var getRandomUsersResponseCalled: Bool = false
    func getRandomUsersResponse(page: Int?, seed: String?) -> UserResponse? {
        getRandomUsersResponseCalled = true
        return page != 0 ? MockUserResponse.getMockUserResponse() : nil
    }

    var deleteRandomUserResponseCalled: Bool = false
    func deleteRandomUserReponse(page: Int) {
        deleteRandomUserResponseCalled = true
    }

    var deleteAllRandomUserResponsesCalled: Bool = false
    func deleteAllRandomUserResponses() {
        deleteAllRandomUserResponsesCalled = true
    }

    var deleteAllObjectsCalled: Bool = false
    func deleteAllObjects() {
        deleteAllObjectsCalled = true
    }

    var updateUserCalled: Bool = false
    func updateUser(user: User) -> User? {
        updateUserCalled = true
        return user.id.uuid == "mockuserfail" ? nil : user
    }

}
