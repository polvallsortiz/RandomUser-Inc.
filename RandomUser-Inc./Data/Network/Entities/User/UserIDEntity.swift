//
//  UserIDEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserIDEntity: Codable {

    var name: String?
    var value: String?

    enum CodingKeys: String, CodingKey {
        case name, value
    }
}

extension UserIDEntity {

    func parseToModel(supportEmail: String) -> UserID {
        var uuid: String
        if let name = self.name, let value = self.value {
            uuid = name + "-" + value
        } else {
            uuid = supportEmail
        }
        return UserID(name: self.name, value: self.value, uuid: uuid)
    }

}
