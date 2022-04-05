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
    
    override func setUp() {
        MockDependencyInjection.mockDependencies()
        randomAPIRepository = MockDependencyInjection.defaultContainer.resolve(RandomAPIRepository.self)
    }

    override func tearDown() {

    }
    
    func testGetRandomUsers() {

        let _ = randomAPIRepository.getRandomUsers(usersToLoad: 5, seed: "4710c75101ed0231", page: 4)
            .subscribe(onSuccess: { response in
                XCTAssertNotNil(response)
                XCTAssertEqual(response.info.page, 4)
                XCTAssertEqual(response.users[0].gender, "female")
                XCTAssertEqual(response.users[1].location.street.name, "Nordenskiöldinkatu")
                XCTAssertEqual(response.users[2].location.timezone.description, "Atlantic Time (Canada), Caracas, La Paz")
                XCTAssertEqual(response.users[3].picture.large, "https://randomuser.me/api/portraits/women/84.jpg")
            }, onFailure: { error in
                XCTAssertNil(error)
            })

    }

}
