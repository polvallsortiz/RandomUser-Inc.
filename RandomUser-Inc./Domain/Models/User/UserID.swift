//
//  UserID.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserID {

    var name: String?
    var value: String?
    var uuid: String

}

extension UserID {

    func parseToLocal() -> UserIDLocal {
        let userIDLocal = UserIDLocal()
        userIDLocal.uuid = self.uuid
        userIDLocal.name = self.name
        userIDLocal.value = self.value
        return userIDLocal
    }

}
