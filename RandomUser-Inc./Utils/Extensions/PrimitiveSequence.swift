//
//  PrimitiveSequence.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation
import RxSwift
import Moya

struct ErrorResponse: Codable {

    var error: String?

    enum CodingKeys: String, CodingKey {
        case error
    }

}

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    func filterErrors() -> Single<Element> {
        return flatMap { response in
            switch response.statusCode {
            case 200...299: return .just(response)
            default:
                do {
                    let errorResponse = try response.map(ErrorResponse.self)
                    guard let errorMessage = errorResponse.error else {
                        throw AppError.parsing(message: "Failed parsing error from API.")
                    }
                    throw AppError.apiError(message: errorMessage)
                } catch {
                    throw AppError.general
                }
            }
        }
    }

}
