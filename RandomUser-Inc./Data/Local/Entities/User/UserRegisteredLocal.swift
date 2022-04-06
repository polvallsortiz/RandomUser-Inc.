//
//  UserRegisteredLocal.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RealmSwift

class UserRegisteredLocal: Object {

    @Persisted var date: Date
    @Persisted var age: Int

}

extension UserRegisteredLocal {

    func parseToModel() -> UserRegistered {
        return UserRegistered(date: self.date, age: self.age)
    }

}
