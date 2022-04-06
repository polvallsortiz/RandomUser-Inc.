//
//  UserEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserEntity: Codable {

    var gender: String
    var name: UserNameEntity
    var location: UserLocationEntity
    var email: String
    var registered: UserRegisteredEntity
    var phone: String
    var id: UserIDEntity
    var picture: UserPictureEntity

    enum CodingKeys: String, CodingKey {
        case gender, name, location, email, registered, phone, id, picture
    }

}

extension UserEntity {

    func parseToModel() -> User {
        return User(gender: self.gender,
                    name: self.name.parseToModel(),
                    location: self.location.parseToModel(),
                    email: self.email,
                    registered: self.registered.parseToModel(),
                    phone: self.phone,
                    id: self.id.parseToModel(supportEmail: self.email),
                    picture: self.picture.parseToModel())
    }

}
