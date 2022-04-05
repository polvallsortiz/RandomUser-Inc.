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
    func deleteRandomUserReponse(page: Int)
    func deleteAllRandomUserResponses()

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
        return getRandomUsersFor(page: page ?? 1)
    }

    func deleteRandomUserReponse(page: Int) {
        try! realm.write {
            let response = realm.objects(UserResponseLocal.self).where { $0.info.page == page }
            realm.delete(response, cascading: true)
        }
    }

    func deleteAllRandomUserResponses() {
        try! realm.write {
            let responses = realm.objects(UserResponseLocal.self)
            realm.delete(responses, cascading: true)
        }
    }

    private func getRandomUsersFor(page: Int = 1) -> UserResponse? {
        let responses = realm.objects(UserResponseLocal.self)
        let responsesQuery = responses.where { $0.info.page == page }
        if let first = responsesQuery.first {
            return first.parseToModel()
        } else { return nil }
    }

}
