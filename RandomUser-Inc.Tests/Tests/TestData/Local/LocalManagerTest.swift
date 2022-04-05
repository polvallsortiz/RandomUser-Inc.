//
//  LocalManagerTest.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import XCTest

class LocalManagerTest: XCTestCase {

    var localManager: LocalManager!
    var mockUserDefaultsRepository: MockUserDefaultsRepositoryImplementation!
    var mockDatabaseRepository: MockDatabaseRepositoryImplementation!

    override func setUp() {
        MockDependencyInjection.mockDependencies()
        localManager = MockDependencyInjection.defaultContainer.resolve(LocalManager.self)
        mockUserDefaultsRepository = MockDependencyInjection.mockContainer.resolve(UserDefaultsRepository.self) as? MockUserDefaultsRepositoryImplementation
        mockDatabaseRepository = MockDependencyInjection.mockContainer.resolve(DatabaseRepository.self) as? MockDatabaseRepositoryImplementation
    }
    
    override func tearDown() {
        
    }

    func testSaveRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        localManager.saveRandomUsersResponse(mockData)
        let savedData = localManager.getRandomUsersResponse(page: mockData.info.page)
        let nextPage = localManager.getNextRandomUsersPage()
        XCTAssertEqual(mockData.users[0].id.uuid, savedData!.users[0].id.uuid)
        XCTAssertEqual(nextPage, mockData.info.page + 1)
    }

    func testGetRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        localManager.saveRandomUsersResponse(mockData)
        let savedData = localManager.getRandomUsersResponse(page: mockData.info.page)
        XCTAssertNotNil(savedData)
        XCTAssertEqual(mockData.users[1].id.uuid, savedData!.users[1].id.uuid)
        let koResponse = localManager.getRandomUsersResponse(page: 0)
        XCTAssertNil(koResponse)
    }

    func testNextRandomUsersPage() {
        let mockData = MockUserResponse.getMockUserResponse()
        localManager.saveRandomUsersResponse(mockData)
        let nextPage = localManager.getNextRandomUsersPage()
        XCTAssertNotNil(nextPage)
        XCTAssertEqual(nextPage, mockData.info.page + 1)
    }

}
