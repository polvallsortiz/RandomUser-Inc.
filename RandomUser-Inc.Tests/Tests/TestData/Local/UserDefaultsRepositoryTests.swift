//
//  UserDefaultsRepositoryTests.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 6/4/22.
//

@testable import RandomUser_Inc_
import XCTest

class UserDefaultsRepositoryTests: XCTestCase {

    var userDefaultsRepository: UserDefaultsRepository!
    var defaults: UserDefaults!

    override func setUp() {
        defaults = UserDefaults(suiteName: "testing")
        userDefaultsRepository = UserDefaultsRepositoryImplementation(defaults: defaults)
    }

    func testSaveLastPage() {
        userDefaultsRepository.saveLastPage(4)
        let savedPage = defaults.integer(forKey: UserDefaultsRepositoryImplementation.UserDefaultsRepositoryKeys.page.rawValue)
        XCTAssertNotNil(savedPage)
        XCTAssertEqual(savedPage, 4)
    }

    func testGetNextPage() {
        defaults.set(10, forKey: UserDefaultsRepositoryImplementation.UserDefaultsRepositoryKeys.page.rawValue)
        let nextPage = userDefaultsRepository.getNextPage()
        XCTAssertNotNil(nextPage)
        XCTAssertEqual(nextPage, 11)
    }

}
