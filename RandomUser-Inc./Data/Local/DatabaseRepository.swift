//
//  DatabaseRepository.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import RealmSwift
import RxSwift

/// DatabaseRepository - Functions to interact with Realm database provider in device
protocol DatabaseRepository {
    func saveRandomUsersResponse(_ response: UserResponse)
    func getRandomUsersResponse(page: Int?, seed: String?) -> UserResponse?
    func deleteRandomUserReponse(page: Int)
    func deleteAllRandomUserResponses()
    func updateUser(user: User) -> User?
    func getUsersByFilter(filter: String) -> Single<[User]>
}

class DatabaseRepositoryImplementation: DatabaseRepository {

    private let realm: Realm!

    init() {
        DatabaseRepositoryImplementation.manageSchemaChanges()
        realm = try! Realm()
    }

    init(realm: Realm) {
        self.realm = realm
    }

    func saveRandomUsersResponse(_ response: UserResponse) {
        var response = response
        if getRandomUsersFor(page: response.info.page, seed: response.info.seed) == nil {
            let cleanUsers = response.users.filter({
                if realm.object(ofType: UserLocal.self, forPrimaryKey: $0.id.uuid) == nil {
                    return true
                }
                return false
            })
            response.users = cleanUsers
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

    func updateUser(user: User) -> User? {
        try! realm.write {
            realm.add(user.parseToLocal(), update: .modified)
        }
        return realm.object(ofType: UserLocal.self, forPrimaryKey: user.id.uuid)?.parseToModel()
    }

    func getUsersByFilter(filter: String) -> Single<[User]> {
        var users = realm.objects(UserLocal.self)
        if !filter.isEmpty {
            users = users.where({
                $0.name.firstName.contains(filter, options: .caseInsensitive) ||
                $0.name.lastName.contains(filter, options: .caseInsensitive) ||
                $0.email.contains(filter, options: .caseInsensitive)
            })
        }

        return Single.just(users.map({ $0.parseToModel() }))
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

    // MARK: Realm Schema Change Function

    static func manageSchemaChanges() {
        let versionNumber: UInt64 = 2
        let config = Realm.Configuration(schemaVersion: versionNumber,
                                         migrationBlock: { migration, oldSchemaVersionNumber in
            if oldSchemaVersionNumber < 2 {
                migration.enumerateObjects(ofType: UserNameLocal.className(), { (oldObject, newObject) in
                    newObject!["firstName"] = oldObject!["first"]
                    newObject!["lastName"] = oldObject!["last"]
                })
            }
        })
        Realm.Configuration.defaultConfiguration = config
    }

}
