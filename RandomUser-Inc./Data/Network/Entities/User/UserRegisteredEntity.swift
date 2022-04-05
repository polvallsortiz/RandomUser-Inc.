//
//  UserRegisteredEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserRegisteredEntity: Codable {

    var date: String
    var age: Int

    enum CodingKeys: String, CodingKey {
        case date, age
    }

}

extension UserRegisteredEntity {

    func parseToModel() -> UserRegistered {
        return UserRegistered(date: ISO8601DateFormatter().defaultFormatter().date(from: self.date)!, age: self.age)
    }

}
