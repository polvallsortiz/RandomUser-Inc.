//
//  User.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct User {

    var gender: String
    var name: UserName
    var location: UserLocation
    var email: String
    var registered: UserRegistered
    var phone: String
    var id: UserID
    var picture: UserPicture

}

extension User {

    func parseToLocal() -> UserLocal {
        let user = UserLocal()
        user.uuid = self.id.uuid
        user.gender = self.gender
        user.name = self.name.parseToLocal()
        user.location = self.location.parseToLocal()
        user.email = self.email
        user.registered = self.registered.parseToLocal()
        user.phone = self.phone
        user.id = self.id.parseToLocal()
        user.picture = self.picture.parseToLocal()
        return user
    }
}
