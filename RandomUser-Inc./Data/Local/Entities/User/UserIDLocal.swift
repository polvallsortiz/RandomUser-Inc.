//
//  UserIDLocal.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RealmSwift

class UserIDLocal: Object {

    @Persisted var name: String
    @Persisted var value: String
    @Persisted var uuid: String

}

extension UserIDLocal {

    func parseToModel() -> UserID {
        return UserID(name: self.name, value: self.value)
    }

}
