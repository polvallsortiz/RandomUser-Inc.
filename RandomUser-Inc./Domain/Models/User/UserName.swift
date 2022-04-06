//
//  UserName.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserName {

    var title: String
    var first: String
    var last: String

}

extension UserName {

    func parseToLocal() -> UserNameLocal {
       let userNameLocal = UserNameLocal()
        userNameLocal.title = self.title
        userNameLocal.firstName = self.first
        userNameLocal.lastName = self.last
        return userNameLocal
    }

}
