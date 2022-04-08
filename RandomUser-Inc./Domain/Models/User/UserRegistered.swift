//
//  UserRegistered.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserRegistered {

    var date: Date
    var age: Int

}

extension UserRegistered {

    func parseToLocal() -> UserRegisteredLocal {
        let userRegisteredLocal = UserRegisteredLocal()
        userRegisteredLocal.date = self.date
        userRegisteredLocal.age = self.age
        return userRegisteredLocal
    }

}
