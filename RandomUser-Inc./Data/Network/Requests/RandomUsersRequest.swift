//
//  RandomUsersRequest.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

class RandomUsersRequest: BaseRequest {

    let usersToLoad: Int
    let seed: String?
    let page: Int?

    init(usersToLoad: Int,
         seed: String? = nil,
         page: Int? = nil) {
        self.usersToLoad = usersToLoad
        self.seed = seed
        self.page = page
    }

    func getParameters() -> [String: Any] {
        var parameters: [String: Any] = [:]
        parameters["results"] = usersToLoad
        parameters["inc"] = "name,gender,location,email,phone,registered,picture,id"
        if let seed = seed {
            parameters["seed"] = seed
        }
        if let page = page {
            parameters["page"] = page
        }
        return parameters
    }
}
