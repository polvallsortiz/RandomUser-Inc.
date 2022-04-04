//
//  UserResponseEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserResponseInfoEntity: Codable {

    var seed: String
    var results: Int
    var page: Int
    var version: String

    enum CodingKeys: String, CodingKey {
        case seed, results, page, version
    }

}

struct UserResponseEntity: Codable {

    var results: [UserEntity]
    var info: UserResponseInfoEntity

    enum CodingKeys: String, CodingKey {
        case results, info
    }

}

extension UserResponseInfoEntity {

    func parseToModel() -> UserResponseInfo {
        return UserResponseInfo(seed: self.seed,
                                results: self.results,
                                page: self.page,
                                version: self.version)
    }

}

extension UserResponseEntity {

    func parseToModel() -> UserResponse {
        return UserResponse(users: self.results.map { $0.parseToModel() },
                            info: self.info.parseToModel())
    }

}
