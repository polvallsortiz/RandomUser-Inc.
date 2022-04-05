//
//  MockUserDefaultsRepository.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

@testable import RandomUser_Inc_
import Foundation

class MockUserDefaultsRepositoryImplementation: UserDefaultsRepository {

    var saveLastPageCalled: Bool = false
    func saveLastPage(_ page: Int) {
        saveLastPageCalled = true
    }

    var getNextPageCalled: Bool = false
    func getNextPage() -> Int? {
        getNextPageCalled = true
        return 2
    }

}
