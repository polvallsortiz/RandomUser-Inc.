//
//  UserLocal.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RealmSwift

class UserLocal: Object {

    @Persisted var uuid: String
    @Persisted var gender: String
    @Persisted var name: UserNameLocal?
    @Persisted var location: UserLocationLocal?
    @Persisted var registered: UserRegisteredLocal?
    @Persisted var phone: String
    @Persisted var id: UserIDLocal?
    @Persisted var picture: UserPictureLocal?

    override static func primaryKey() -> String? {
        return "uuid"
    }

}

extension UserLocal {

    func parseToModel() -> User {
        return User(gender: self.gender,
                    name: (self.name?.parseToModel())!,
                    location: (self.location?.parseToModel())!,
                    registered: (self.registered?.parseToModel())!,
                    phone: self.phone,
                    id: (self.id?.parseToModel())!,
                    picture: (self.picture?.parseToModel())!)
    }

}
