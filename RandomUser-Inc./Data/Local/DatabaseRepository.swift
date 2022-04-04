//
//  DatabaseRepository.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import RealmSwift

/// DatabaseRepository - Functions to interact with Realm database provider in device
protocol DatabaseRepository {

    func saveRandomUsersResponse(_ response: UserResponse)
    func getRandomUsersResponse(page: Int?) -> UserResponse?

}

class DatabaseRepositoryImplementation: DatabaseRepository {
    
    private let realm: Realm!

    init() {
        realm = try! Realm()
    }

    func saveRandomUsersResponse(_ response: UserResponse) {

        if getRandomUsersFor(page: response.info.page) == nil {
            try! realm.write { () -> Void in
                let userResponseLocal = response.parseToLocal()
                realm.add(userResponseLocal)
            }
        }

    }

    func getRandomUsersResponse(page: Int?) -> UserResponse? {
        return getRandomUsersResponse(page: page)
    }

    private func getRandomUsersFor(page: Int = 1) -> UserResponse? {
        let responses = realm.objects(UserResponseLocal.self)
        let responsesQuery = responses.where { $0.info.page == page }
        return responsesQuery.first?.parseToModel()
    }

}
