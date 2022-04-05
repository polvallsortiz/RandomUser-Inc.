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
            return Single<UserResponse>.error(NSError(domain: "mockerror", code: 0))
        } else {
            return Single.just(MockUserResponse.getMockUserResponse())
        }
    }

}

