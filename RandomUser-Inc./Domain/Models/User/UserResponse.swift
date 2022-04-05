//
//  UserResponse.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserResponseInfo {

    var seed: String
    var results: Int
    var page: Int
    var version: String

}

struct UserResponse {

    var users: [User]
    var info: UserResponseInfo

}

extension UserResponseInfo {

    func parseToLocal() -> UserResponseInfoLocal {
        let userResponseInfoLocal = UserResponseInfoLocal()
        userResponseInfoLocal.seed = self.seed
        userResponseInfoLocal.results = self.results
        userResponseInfoLocal.page = self.page
        userResponseInfoLocal.version = self.version
        return userResponseInfoLocal
    }

}

extension UserResponse {

    func parseToLocal() -> UserResponseLocal {
        let userResponseLocal = UserResponseLocal()
        for user in self.users {
            userResponseLocal.users.append(user.parseToLocal())
        }
        userResponseLocal.info = self.info.parseToLocal()
        return userResponseLocal
    }

}
