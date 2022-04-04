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
        
    }
}
