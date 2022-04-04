//
//  UserNameLocal.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RealmSwift

class UserNameLocal: Object {

    @Persisted var title: String
    @Persisted var first: String
    @Persisted var last: String

}

extension UserNameLocal {

    func parseToModel() -> UserName {
        return UserName(title: self.title, first: self.first, last: self.last)
    }

}
