//
//  MockRandomAPIInteractor.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import RxSwift

class MockRandomAPIInteractorImplementation: RandomAPIInteractor {

    private var mockRandomAPIRepository: RandomAPIRepository

    init(mockRandomAPIRepository: RandomAPIRepository) {
        self.mockRandomAPIRepository = mockRandomAPIRepository
    }

    var getRandomUsersCalled: Bool = false
    func getRandomUsers(usersToLoad: Int, seed: String?, page: Int?) -> Single<UserResponse> {
        getRandomUsersCalled = true
        let response = MockUserResponse.getMockUserResponse()
        if page == 0 {
            return Single<UserResponse>.error(NSError(domain: "mockerror", code: 0))
        } else {
            return Single.just(response)
        }
    }

    var updateUserCalled: Bool = false
    func updateUser(user: User) -> User? {
        updateUserCalled = true
        return user.id.uuid == "mockuserfail" ? nil : user
    }

}
