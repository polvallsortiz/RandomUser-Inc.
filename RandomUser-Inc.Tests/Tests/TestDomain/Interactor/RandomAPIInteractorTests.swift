//
//  RandomAPIInteractorTests.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import XCTest

class RandomAPIInteractorTests: XCTestCase {

    var randomAPIInteractor: RandomAPIInteractor!
    var mockRandomAPIRepository: MockRandomAPIRepositoryImplementation!

    override func setUp() {
        MockDependencyInjection.mockDependencies()
        mockRandomAPIRepository = MockDependencyInjection.mockContainer.resolve(RandomAPIRepository.self) as? MockRandomAPIRepositoryImplementation
        randomAPIInteractor = RandomAPIInteractorImplementation(randomAPIRepository: mockRandomAPIRepository)
    }

    override func tearDown() {

    }

    func testGetRandomUsers() {
        let responseMock = MockUserResponse.getMockUserResponse()
        
        let _ = randomAPIInteractor.getRandomUsers(usersToLoad: 5, seed: "4710c75101ed0231", page: 4)
            .subscribe(onSuccess: { response in
                XCTAssertEqual(self.mockRandomAPIRepository.getRandomUsersCalled, true)
                XCTAssertNotNil(response)
                XCTAssertEqual(response.info.page, responseMock.info.page)
                XCTAssertEqual(response.users.count, responseMock.users.count)
                XCTAssertEqual(response.users[0].gender, responseMock.users[0].gender)
                XCTAssertEqual(response.users[1].location.street.name, responseMock.users[1].location.street.name)
            })
        
        let _ = randomAPIInteractor.getRandomUsers(usersToLoad: 10, seed: nil, page: 0)
            .subscribe(onFailure: { error in
                let appError = error as? AppError
                XCTAssertNotNil(appError)
                XCTAssertEqual(appError?.localizedDescription, "API error API fetching error")
            })
    }
    
    func testUpdateUser() {
        var mockUser = MockUser.getMockUser()
        let updatedUser = randomAPIInteractor.updateUser(user: mockUser)
        XCTAssertEqual(mockRandomAPIRepository.updateUserCalled, true)
        XCTAssertNotNil(updatedUser)
        XCTAssertEqual(updatedUser?.id.uuid, mockUser.id.uuid)
        
        mockUser.id.uuid = "mockuserfail"
        let koUpdated = randomAPIInteractor.updateUser(user: mockUser)
        XCTAssertNil(koUpdated)
    }
    
    func testSearchUsers() {
        let _ = randomAPIInteractor.searchUsers(filter: "ok").subscribe(onSuccess: { response in
            XCTAssertNotNil(response)
            XCTAssertTrue(self.mockRandomAPIRepository.searchUsersCalled)
            XCTAssertEqual(response.count, 3)
        })
        
        let _ = randomAPIInteractor.searchUsers(filter: "mockfilterfail").subscribe(onSuccess: { koResponse in
            XCTAssertNotNil(koResponse)
            XCTAssertTrue(self.mockRandomAPIRepository.searchUsersCalled)
            XCTAssertEqual(koResponse.count, 0)
        })
    }

}
