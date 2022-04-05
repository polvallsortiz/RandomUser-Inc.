//
//  DatabaseRepositoryTest.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import XCTest

class DatabaseRepositoryTest: XCTestCase {

    var databaseRepository: DatabaseRepository!

    override func setUp() {
        MockDependencyInjection.mockDependencies()
        databaseRepository = MockDependencyInjection.defaultContainer.resolve(DatabaseRepository.self)
    }

    override func tearDown() {
        databaseRepository.deleteAllRandomUserResponses()
    }
    
    func testSaveRandomUsersResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        databaseRepository.saveRandomUsersResponse(mockData)
        let okResponse1 = databaseRepository.getRandomUsersResponse(page: mockData.info.page)
        XCTAssertEqual(mockData.users[0].id.uuid, okResponse1?.users[0].id.uuid)
    }
    
    func testGetRandomUserResponse() {
        databaseRepository.deleteAllRandomUserResponses()
        let mockData = MockUserResponse.getMockUserResponse()
        let mockData2 = MockUserResponse.getMockUserResponse2()
        databaseRepository.saveRandomUsersResponse(mockData)
        let okResponse1 = databaseRepository.getRandomUsersResponse(page: mockData.info.page)
        XCTAssertEqual(mockData.users[0].id.uuid, okResponse1?.users[0].id.uuid)
        let koResponse1 = databaseRepository.getRandomUsersResponse(page: mockData2.info.page)
        XCTAssertNil(koResponse1)
        databaseRepository.saveRandomUsersResponse(mockData2)
        let okResponse2 = databaseRepository.getRandomUsersResponse(page: mockData2.info.page)
        XCTAssertEqual(mockData2.users[0].id.uuid, okResponse2?.users[0].id.uuid)
    }
    
    func testDeleteRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        let mockData2 = MockUserResponse.getMockUserResponse2()
        databaseRepository.saveRandomUsersResponse(mockData)
        databaseRepository.saveRandomUsersResponse(mockData2)
        databaseRepository.deleteRandomUserReponse(page: mockData.info.page)
        let koResponse = databaseRepository.getRandomUsersResponse(page: mockData.info.page)
        XCTAssertNil(koResponse)
        let okResponse = databaseRepository.getRandomUsersResponse(page: mockData2.info.page)
        XCTAssertEqual(mockData2.users[0].id.uuid, okResponse?.users[0].id.uuid)
    }
    
    func testDeleteAllRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        let mockData2 = MockUserResponse.getMockUserResponse2()
        databaseRepository.saveRandomUsersResponse(mockData)
        databaseRepository.saveRandomUsersResponse(mockData2)
        databaseRepository.deleteAllRandomUserResponses()
        let koResponse1 = databaseRepository.getRandomUsersResponse(page: mockData.info.page)
        let koResponse2 = databaseRepository.getRandomUsersResponse(page: mockData2.info.page)
        XCTAssertNil(koResponse1)
        XCTAssertNil(koResponse2)
    }

}
