//
//  UserIDEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserIDEntity: Codable {
    
    var name: String
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case name, value
    }
}

extension UserIDEntity {

    func parseToModel() -> UserID {
        return UserID(name: self.name, value: self.value)
    }

}
