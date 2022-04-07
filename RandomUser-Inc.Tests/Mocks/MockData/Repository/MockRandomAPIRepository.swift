//
//  MockRandomAPIRepository.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import RxSwift
import Moya

class MockRandomAPIRepositoryImplementation: BaseRepositoryImplementation, RandomAPIRepository {

    var getRandomUsersCalled: Bool = false
    func getRandomUsers(usersToLoad: Int, seed: String?, page: Int?) -> Single<UserResponse> {
        getRandomUsersCalled = true
        if page == 0 {
            return Single.error(AppError.apiError(message: "API fetching error"))
        } else {
            return Single.just(MockUserResponse.getMockUserResponse())
        }
    }

    var updateUserCalled: Bool = false
    func updateUser(user: User) -> User? {
        updateUserCalled = true
        return user.id.uuid == "mockuserfail" ? nil : user
    }

    var searchUsersCalled: Bool = false
    func searchUsers(filter: String) -> Single<[User]> {
        searchUsersCalled = true
        return filter == "mockfilterfail" ? Single.just([]) : Single.just(MockUser.getMockUserArray())
    }
}
