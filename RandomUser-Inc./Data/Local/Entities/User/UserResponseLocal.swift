//
//  UserResponseLocal.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RealmSwift

class UserResponseInfoLocal: Object {

    @Persisted var seed: String
    @Persisted var results: Int
    @Persisted var page: Int
    @Persisted var version: String

}

class UserResponseLocal: Object {

    @Persisted var users: List<UserLocal?>
    @Persisted var info: UserResponseInfoLocal?

}

extension UserResponseInfoLocal {

    func parseToModel() -> UserResponseInfo {
        return UserResponseInfo(seed: self.seed,
                                results: self.results,
                                page: self.page,
                                version: self.version)
    }

}

extension UserResponseLocal {

    func parseToModel() -> UserResponse {
        var userResponse = UserResponse(users: [], info: (self.info?.parseToModel())!)
        userResponse.users = self.users.compactMap { $0?.parseToModel() }
        return userResponse
    }

}
