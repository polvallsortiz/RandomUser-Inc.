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
        mockUserDefaultsRepository = MockDependencyInjection.mockContainer.resolve(UserDefaultsRepository.self) as? MockUserDefaultsRepositoryImplementation
        mockDatabaseRepository = MockDependencyInjection.mockContainer.resolve(DatabaseRepository.self) as? MockDatabaseRepositoryImplementation
        localManager = LocalManagerImplementation(userDefaultsRepository: mockUserDefaultsRepository, databaseRepository: mockDatabaseRepository)
    }
    
    override func tearDown() {
        localManager = nil
        mockUserDefaultsRepository = nil
        mockDatabaseRepository = nil
    }

    func testSaveRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        localManager.saveRandomUsersResponse(mockData)
        XCTAssertEqual(mockUserDefaultsRepository.saveLastPageCalled, true)
        XCTAssertEqual(mockDatabaseRepository.saveRandomUserResponseCalled, true)
    }

    func testGetRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        let response = localManager.getRandomUsersResponse(page: mockData.info.page,
                                                           seed: mockData.info.seed)
        
        XCTAssertEqual(mockDatabaseRepository.getRandomUsersResponseCalled, true)
        XCTAssertNotNil(response)
        XCTAssertEqual(mockData.users[0].id.uuid, response?.users[0].id.uuid)
        let koResponse = localManager.getRandomUsersResponse(page: 0, seed: mockData.info.seed)
        XCTAssertNil(koResponse)
    }

    func testNextRandomUsersPage() {
        let response = localManager.getNextRandomUsersPage()
        XCTAssertEqual(mockUserDefaultsRepository.getNextPageCalled, true)
        XCTAssertNotNil(response)
        XCTAssertEqual(response, 2)
    }

    func testUpdateUser() {
        var mockUpdate = MockUser.getMockUser()
        let updatedUser = localManager.updateUser(user: mockUpdate)
        XCTAssertEqual(mockDatabaseRepository.updateUserCalled, true)
        XCTAssertNotNil(updatedUser)
        XCTAssertEqual(updatedUser?.id.uuid, mockUpdate.id.uuid)
        mockUpdate.email += "testemail"
        let updatedUser2 = localManager.updateUser(user: mockUpdate)
        XCTAssertNotNil(updatedUser2)
        XCTAssertEqual(updatedUser2?.email, updatedUser!.email + "testemail")
        mockUpdate.id.uuid = "mockuserfail"
        let koUpdatedUser = localManager.updateUser(user: mockUpdate)
        XCTAssertNil(koUpdatedUser)
    }

}
