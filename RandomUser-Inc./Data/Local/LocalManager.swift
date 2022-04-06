//
//  LocalManager.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import RxSwift

/// LocalManager - Base functions to handle local data in device
protocol LocalManager {
    func saveRandomUsersResponse(_ response: UserResponse)
    func getRandomUsersResponse(page: Int?, seed: String?) -> UserResponse?
    func getNextRandomUsersPage() -> Int?
    func updateUser(user: User) -> User?
    func getUsersByFilter(filter: String) -> Single<[User]>
}

class LocalManagerImplementation: LocalManager {
    private let userDefaultsRepository: UserDefaultsRepository
    private let databaseRepository: DatabaseRepository

    init(userDefaultsRepository: UserDefaultsRepository, databaseRepository: DatabaseRepository) {
        self.userDefaultsRepository = userDefaultsRepository
        self.databaseRepository = databaseRepository
    }

    func saveRandomUsersResponse(_ response: UserResponse) {
        self.userDefaultsRepository.saveLastPage(response.info.page)
        self.databaseRepository.saveRandomUsersResponse(response)
    }

    func getRandomUsersResponse(page: Int?, seed: String?) -> UserResponse? {
        return self.databaseRepository.getRandomUsersResponse(page: page, seed: seed)
    }

    func getNextRandomUsersPage() -> Int? {
        return self.userDefaultsRepository.getNextPage()
    }

    func updateUser(user: User) -> User? {
        return self.databaseRepository.updateUser(user: user)
    }

    func getUsersByFilter(filter: String) -> Single<[User]> {
        return self.databaseRepository.getUsersByFilter(filter: filter)
    }

}
