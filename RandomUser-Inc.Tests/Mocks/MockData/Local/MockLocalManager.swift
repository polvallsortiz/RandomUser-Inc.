//
//  MockLocalManager.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import RxSwift

class MockLocalManagerImplementation: LocalManager {

    var saveRandomUserResponseCalled: Bool = false
    func saveRandomUsersResponse(_ response: UserResponse) {
        saveRandomUserResponseCalled = true
    }

    var getRandomUsersResponseCalled: Bool = false
    func getRandomUsersResponse(page: Int?, seed: String?) -> UserResponse? {
        getRandomUsersResponseCalled = true
        return page != 0 ? MockUserResponse.getMockUserResponse() : nil
    }

    var getNextRandomUsersPageCalled: Bool = false
    func getNextRandomUsersPage() -> Int? {
        getNextRandomUsersPageCalled = true
        return 2
    }
    
    var updateUserCalled: Bool = false
    func updateUser(user: User) -> User? {
        updateUserCalled = true
        return user.id.uuid == "mockuserfail" ? nil : user
    }
    
    var getUsersByFilterCalled: Bool = false
    func getUsersByFilter(filter: String) -> Single<[User]> {
        getUsersByFilterCalled = true
        return filter == "mockfilterfail" ? Single.just([]) : Single.just(MockUser.getMockUserArray())
    }

}
