//
//  UserPicture.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserPicture {

    var large: String
    var medium: String
    var thumbnail: String

}

extension UserPicture {

    func parseToLocal() -> UserPictureLocal {
        let userPictureLocal = UserPictureLocal()
        userPictureLocal.large = self.large
        userPictureLocal.medium = self.medium
        userPictureLocal.thumbnail = self.thumbnail
        return userPictureLocal
    }

}
