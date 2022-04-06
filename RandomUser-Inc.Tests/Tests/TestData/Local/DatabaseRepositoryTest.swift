//
//  DatabaseRepositoryTest.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import XCTest
import RealmSwift

class DatabaseRepositoryTest: XCTestCase {

    var databaseRepository: DatabaseRepository!
    var realm: Realm!

    override func setUp() {
        MockDependencyInjection.mockDependencies()
        var realmConfig = Realm.Configuration()
        realmConfig.fileURL = realmConfig.fileURL!.deletingLastPathComponent().appendingPathComponent("testing.realm")
        realmConfig.inMemoryIdentifier = self.name
        realm = try! Realm(configuration: realmConfig)
        databaseRepository = DatabaseRepositoryImplementation(realm: realm)
    }

    override func tearDown() {
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    func testSaveRandomUsersResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        databaseRepository.saveRandomUsersResponse(mockData)
        let userResponse = realm.objects(UserResponseLocal.self)
        XCTAssertNotNil(userResponse)
        XCTAssertEqual(userResponse.count, 1)
        XCTAssertEqual(userResponse.first?.users.count, 2)
        var mockData2 = MockUserResponse.getMockUserResponse()
        mockData2.info.page = mockData.info.page + 1
        databaseRepository.saveRandomUsersResponse(mockData2)
        let users = realm.objects(UserLocal.self)
        XCTAssertNotNil(users)
        XCTAssertEqual(users.count, 2)
    }
    
    func testGetRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        try! realm.write {
            let mockDataLocal = mockData.parseToLocal()
            realm.add(mockDataLocal)
        }
        let okResponse = databaseRepository.getRandomUsersResponse(page: mockData.info.page, seed: mockData.info.seed)
        XCTAssertNotNil(okResponse)
        XCTAssertEqual(okResponse?.users.count, mockData.users.count)
        XCTAssertEqual(mockData.users[0].id.uuid, okResponse?.users[0].id.uuid)
        let koResponse = databaseRepository.getRandomUsersResponse(page: mockData.info.page, seed: "badseed")
        XCTAssertNil(koResponse)
        let koResponse2 = databaseRepository.getRandomUsersResponse(page: 0, seed: mockData.info.seed)
        XCTAssertNil(koResponse2)
    }
    
    func testDeleteRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        let mockData2 = MockUserResponse.getMockUserResponse2()
        try! realm.write {
            let mockDataLocal = mockData.parseToLocal()
            let mockDataLocal2 = mockData2.parseToLocal()
            realm.add(mockDataLocal)
            realm.add(mockDataLocal2)
        }
        databaseRepository.deleteRandomUserReponse(page: mockData.info.page)
        let koResponse = realm.objects(UserResponseLocal.self).where { $0.info.page == mockData.info.page }
        XCTAssertEqual(koResponse.count, 0)
        let okResponse = realm.objects(UserResponseLocal.self).where { $0.info.page == mockData2.info.page }
        XCTAssertNotNil(okResponse)
        XCTAssertEqual(okResponse.count, 1)
        XCTAssertNotNil(okResponse.first)
        XCTAssertEqual(mockData2.users[0].id.uuid, okResponse.first?.users[0].id?.uuid)
    }
    
    func testDeleteAllRandomUserResponse() {
        let mockData = MockUserResponse.getMockUserResponse()
        let mockData2 = MockUserResponse.getMockUserResponse2()
        try! realm.write {
            let mockDataLocal = mockData.parseToLocal()
            let mockDataLocal2 = mockData2.parseToLocal()
            realm.add(mockDataLocal)
            realm.add(mockDataLocal2)
        }
        databaseRepository.deleteAllRandomUserResponses()
        let koResponse1 = realm.objects(UserResponseLocal.self).where { $0.info.page == mockData.info.page }
        let koResponse2 = realm.objects(UserResponseLocal.self).where { $0.info.page == mockData2.info.page }
        XCTAssertEqual(koResponse1.count, 0)
        XCTAssertEqual(koResponse2.count, 0)
    }
    
    func testUpdateUser() {
        let mockUser = MockUser.getMockUser()
        try! realm.write {
            realm.add(mockUser.parseToLocal())
        }
        let savedUser = realm.object(ofType: UserLocal.self, forPrimaryKey: mockUser.id.uuid)
        XCTAssertEqual(savedUser?.uuid, mockUser.id.uuid)
        XCTAssertEqual(savedUser?.deleted, false)
        var mockUser2 = mockUser
        mockUser2.deleted = true
        let updatedUser = databaseRepository.updateUser(user: mockUser2)
        let savedUser2 = realm.object(ofType: UserLocal.self, forPrimaryKey: mockUser2.id.uuid)
        XCTAssertNotNil(updatedUser)
        XCTAssertNotNil(savedUser2)
        XCTAssertEqual(updatedUser?.id.uuid, savedUser2?.uuid)
        XCTAssertEqual(updatedUser?.deleted, true)
    }

}
