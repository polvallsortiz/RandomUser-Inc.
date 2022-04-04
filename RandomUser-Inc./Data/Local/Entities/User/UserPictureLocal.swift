//
//  UserPictureLocal.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RealmSwift

class UserPictureLocal: Object {

    @Persisted var large: String
    @Persisted var medium: String
    @Persisted var thumbnail: String

}

extension UserPictureLocal {

    func parseToModel() -> UserPicture {
        return UserPicture(large: self.large, medium: self.medium, thumbnail: self.thumbnail)
    }

}
