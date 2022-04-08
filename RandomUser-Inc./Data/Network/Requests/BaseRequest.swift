//
//  BaseRequest.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation

/// BaseRequest - Creates a request base which all requests must inherit
class BaseRequest {

    init() { }

    func getCommonHeaders() -> [String: String] {
        var headers: [String: String] = [:]
        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/json"
        return headers
    }

}
