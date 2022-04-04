//
//  UserPictureEntity.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserPictureEntity: Codable {

    var large: String
    var medium: String
    var thumbnail: String

    enum CodingKeys: String, CodingKey {
        case large, medium, thumbnail
    }

}

extension UserPictureEntity {

    func parseToModel() -> UserPicture {
        return UserPicture(large: self.large, medium: self.medium, thumbnail: self.thumbnail)
    }

}
