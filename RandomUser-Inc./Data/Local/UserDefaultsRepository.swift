//
//  UserDefaultsRepository.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation

/// UserDefaultsRepository - Functions to interact with UserDefaults in device
protocol UserDefaultsRepository {
    func saveLastPage(_ page: Int)
    func getNextPage() -> Int?
}

class UserDefaultsRepositoryImplementation: UserDefaultsRepository {

    private let defaults: UserDefaults

    init(defaults: UserDefaults) {
        self.defaults = defaults
    }

    enum UserDefaultsRepositoryKeys: String {
        case page = "random_users_page"
    }

    func saveLastPage(_ page: Int) {
        defaults.set(page, forKey: UserDefaultsRepositoryKeys.page.rawValue)
    }

    func getNextPage() -> Int? {
        let value = defaults.integer(forKey: UserDefaultsRepositoryKeys.page.rawValue)
        return value == 0 ? nil : value + 1
    }

}
