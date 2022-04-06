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
    func getRandomUsersResponse(page: Int?, seed: String?) -> UserResponse?
    func deleteRandomUserReponse(page: Int)
    func deleteAllRandomUserResponses()

}

class DatabaseRepositoryImplementation: DatabaseRepository {

    private let realm: Realm!

    init() {
        realm = try! Realm()
    }

    init(realm: Realm) {
        self.realm = realm
    }

    func saveRandomUsersResponse(_ response: UserResponse) {

        if getRandomUsersFor(page: response.info.page, seed: response.info.seed) == nil {
            try! realm.write { () -> Void in
                let userResponseLocal = response.parseToLocal()
                realm.add(userResponseLocal)
            }
        }

    }

    func getRandomUsersResponse(page: Int?, seed: String?) -> UserResponse? {
        return getRandomUsersFor(page: page ?? 1, seed: seed)
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

    private func getRandomUsersFor(page: Int = 1, seed: String?) -> UserResponse? {
        let responses = realm.objects(UserResponseLocal.self)
        var responsesQuery = responses.where { $0.info.page == page }
        if let seed = seed {
            responsesQuery = responsesQuery.where { $0.info.seed == seed }
        }
        if let first = responsesQuery.first {
            return first.parseToModel()
        } else { return nil }
    }

}
