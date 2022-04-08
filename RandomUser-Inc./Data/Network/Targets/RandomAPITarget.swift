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

    var sampleData: Data {
        switch self {
        case .randomUsers:
            // swiftlint:disable:next line_length
            return "{\"results\":[{\"gender\":\"male\",\"name\":{\"title\":\"Mr\",\"first\":\"Sandro\",\"last\":\"Caron\"},\"location\":{\"street\":{\"number\":90,\"name\":\"Place de L'Abbé-Georges-Hénocque\"},\"city\":\"Metz\",\"state\":\"Alpes-de-Haute-Provence\",\"country\":\"France\",\"postcode\":94650,\"coordinates\":{\"latitude\":\"-0.3552\",\"longitude\":\"-19.2359\"},\"timezone\":{\"offset\":\"+5:00\",\"description\":\"Ekaterinburg, Islamabad, Karachi, Tashkent\"}},\"email\":\"sandro.caron@example.com\",\"registered\":{\"date\":\"2013-02-02T10:05:06.364Z\",\"age\":9},\"phone\":\"02-56-80-78-97\",\"id\":{\"name\":\"INSEE\",\"value\":\"1NNaN56430968 53\"},\"picture\":{\"large\":\"https://randomuser.me/api/portraits/men/38.jpg\",\"medium\":\"https://randomuser.me/api/portraits/med/men/38.jpg\",\"thumbnail\":\"https://randomuser.me/api/portraits/thumb/men/38.jpg\"}},{\"gender\":\"male\",\"name\":{\"title\":\"Mr\",\"first\":\"Agustin\",\"last\":\"Lorenzo\"},\"location\":{\"street\":{\"number\":1137,\"name\":\"Calle de Arganzuela\"},\"city\":\"La Palma\",\"state\":\"Navarra\",\"country\":\"Spain\",\"postcode\":65192,\"coordinates\":{\"latitude\":\"44.3251\",\"longitude\":\"77.7480\"},\"timezone\":{\"offset\":\"-2:00\",\"description\":\"Mid-Atlantic\"}},\"email\":\"agustin.lorenzo@example.com\",\"registered\":{\"date\":\"2007-08-03T12:46:19.527Z\",\"age\":15},\"phone\":\"941-162-286\",\"id\":{\"name\":\"DNI\",\"value\":\"02189439-E\"},\"picture\":{\"large\":\"https://randomuser.me/api/portraits/men/70.jpg\",\"medium\":\"https://randomuser.me/api/portraits/med/men/70.jpg\",\"thumbnail\":\"https://randomuser.me/api/portraits/thumb/men/70.jpg\"}},{\"gender\":\"female\",\"name\":{\"title\":\"Ms\",\"first\":\"Alex\",\"last\":\"Knight\"},\"location\":{\"street\":{\"number\":4080,\"name\":\"North Street\"},\"city\":\"Tramore\",\"state\":\"South Dublin\",\"country\":\"Ireland\",\"postcode\":32697,\"coordinates\":{\"latitude\":\"71.4324\",\"longitude\":\"-72.7159\"},\"timezone\":{\"offset\":\"-10:00\",\"description\":\"Hawaii\"}},\"email\":\"alex.knight@example.com\",\"registered\":{\"date\":\"2002-08-01T14:30:52.705Z\",\"age\":20},\"phone\":\"051-798-4627\",\"id\":{\"name\":\"PPS\",\"value\":\"4181835T\"},\"picture\":{\"large\":\"https://randomuser.me/api/portraits/women/49.jpg\",\"medium\":\"https://randomuser.me/api/portraits/med/women/49.jpg\",\"thumbnail\":\"https://randomuser.me/api/portraits/thumb/women/49.jpg\"}},{\"gender\":\"male\",\"name\":{\"title\":\"Mr\",\"first\":\"Alejandro\",\"last\":\"Gallego\"},\"location\":{\"street\":{\"number\":5771,\"name\":\"Calle de Segovia\"},\"city\":\"Móstoles\",\"state\":\"País Vasco\",\"country\":\"Spain\",\"postcode\":27448,\"coordinates\":{\"latitude\":\"-25.9253\",\"longitude\":\"144.2770\"},\"timezone\":{\"offset\":\"-5:00\",\"description\":\"Eastern Time (US & Canada), Bogota, Lima\"}},\"email\":\"alejandro.gallego@example.com\",\"registered\":{\"date\":\"2009-11-28T12:31:57.342Z\",\"age\":13},\"phone\":\"980-563-865\",\"id\":{\"name\":\"DNI\",\"value\":\"84122101-U\"},\"picture\":{\"large\":\"https://randomuser.me/api/portraits/men/48.jpg\",\"medium\":\"https://randomuser.me/api/portraits/med/men/48.jpg\",\"thumbnail\":\"https://randomuser.me/api/portraits/thumb/men/48.jpg\"}},{\"gender\":\"male\",\"name\":{\"title\":\"Mr\",\"first\":\"Solomon\",\"last\":\"Ekkel\"},\"location\":{\"street\":{\"number\":1414,\"name\":\"De Repelaer\"},\"city\":\"Jislum\",\"state\":\"Friesland\",\"country\":\"Netherlands\",\"postcode\":19831,\"coordinates\":{\"latitude\":\"-4.3921\",\"longitude\":\"47.5951\"},\"timezone\":{\"offset\":\"+9:30\",\"description\":\"Adelaide, Darwin\"}},\"email\":\"solomon.ekkel@example.com\",\"registered\":{\"date\":\"2011-07-16T00:29:27.384Z\",\"age\":11},\"phone\":\"(428)-264-5248\",\"id\":{\"name\":\"BSN\",\"value\":\"45309408\"},\"picture\":{\"large\":\"https://randomuser.me/api/portraits/men/34.jpg\",\"medium\":\"https://randomuser.me/api/portraits/med/men/34.jpg\",\"thumbnail\":\"https://randomuser.me/api/portraits/thumb/men/34.jpg\"}}],\"info\":{\"seed\":\"4710c75101ed0231\",\"results\":5,\"page\":3,\"version\":\"1.3\"}}".data(using: String.Encoding.utf8)!
        }
    }

}
