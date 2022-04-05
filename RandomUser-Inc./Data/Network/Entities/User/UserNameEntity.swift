//
//  UserNameEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserNameEntity: Codable {

    var title: String
    var first: String
    var last: String

    enum CodingKeys: String, CodingKey {
        case title, first, last
    }

}

extension UserNameEntity {

    func parseToModel() -> UserName {
        return UserName(title: self.title, first: self.first, last: self.last)
    }

}
