//
//  UserID.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

struct UserID {

    var name: String
    var value: String
    var uuid: String {
        return name + "-" + value
    }

}