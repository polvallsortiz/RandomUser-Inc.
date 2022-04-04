//
//  RandomAPITarget.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Moya

enum RandomAPITarget {

    case randomUsers(request: RandomUsersRequest)

}

extension RandomAPITarget: TargetType {

    var baseURL: URL {
        return URL(string: NetworkManagerImplementation.getBaseUrl())!
    }

    var path: String {
        switch self {
        case .randomUsers:
            return "/"
        }
    }

    var method: Method {
        switch self {
        case .randomUsers:
            return .get
        }
    }

    var headers: [String : String]? {
        var headers: [String: String] = [:]
        switch self {
        case .randomUsers(let request):
            headers = request.getCommonHeaders()
        }
        return headers
    }

    var task: Task {
        switch self {
        case .randomUsers(let request):
            return .requestParameters(parameters: request.getParameters(), encoding: URLEncoding.queryString)
        }
    }
}
