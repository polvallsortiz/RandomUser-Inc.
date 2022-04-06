//
//  RandomAPIRepositoryTests.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

@testable import RandomUser_Inc_
import XCTest
import RxSwift

class RandomAPIRepositoryTests: XCTestCase {

    var randomAPIRepository: RandomAPIRepository!
    var mockLocalManager: MockLocalManagerImplementation!
    var mockNetworkManager: MockNetworkManagerImplementation!
    
    override func setUp() {
        MockDependencyInjection.mockDependencies()
        mockLocalManager = MockDependencyInjection.mockContainer.resolve(LocalManager.self) as? MockLocalManagerImplementation
        mockNetworkManager = MockDependencyInjection.mockContainer.resolve(NetworkManager.self) as? MockNetworkManagerImplementation
        randomAPIRepository = RandomAPIRepositoryImplementation(localManager: mockLocalManager, networkManager: mockNetworkManager)
    }

    override func tearDown() {

    }
    
    func testGetRandomUsers() {

        let _ = randomAPIRepository.getRandomUsers(usersToLoad: 5, seed: "4710c75101ed0231", page: 0)
            .subscribe(onSuccess: { response in
                XCTAssertEqual(self.mockLocalManager.getRandomUsersResponseCalled, true)
                XCTAssertEqual(self.mockNetworkManager.makeRequestCalled, true)
                XCTAssertNotNil(response)
                XCTAssertEqual(response.info.page, 4)
                XCTAssertEqual(response.users[0].gender, "female")
                XCTAssertEqual(response.users[1].location.street.name, "Nordenskiöldinkatu")
                XCTAssertEqual(response.users[2].location.timezone.description, "Atlantic Time (Canada), Caracas, La Paz")
                XCTAssertEqual(response.users[3].picture.large, "https://randomuser.me/api/portraits/women/84.jpg")
            })
        
        self.mockLocalManager.getRandomUsersResponseCalled = false
        self.mockNetworkManager.makeRequestCalled = false
        
        let responseMock = MockUserResponse.getMockUserResponse()
        let _ = randomAPIRepository.getRandomUsers(usersToLoad: 10, seed: "testseed", page: 1)
            .subscribe(onSuccess: { response in
                XCTAssertEqual(self.mockLocalManager.getRandomUsersResponseCalled, true)
                XCTAssertEqual(self.mockNetworkManager.makeRequestCalled, false)
                XCTAssertNotNil(response)
                XCTAssertEqual(response.info.page, responseMock.info.page)
                XCTAssertEqual(response.users.count, responseMock.users.count)
                XCTAssertEqual(response.users[0].gender, responseMock.users[0].gender)
                XCTAssertEqual(response.users[1].location.street.name, responseMock.users[1].location.street.name)
            })

    }
    
    func testUpdateUser() {
        var mockUser = MockUser.getMockUser()
        let updatedUser = randomAPIRepository.updateUser(user: mockUser)
        XCTAssertEqual(mockLocalManager.updateUserCalled, true)
        XCTAssertNotNil(updatedUser)
        XCTAssertEqual(updatedUser?.id.uuid, mockUser.id.uuid)
        
        mockUser.id.uuid = "mockuserfail"
        let koUpdatedUser = randomAPIRepository.updateUser(user: mockUser)
        XCTAssertNil(koUpdatedUser)
    }

}
