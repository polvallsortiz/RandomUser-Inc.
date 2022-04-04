//
//  NetworkManager.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import Moya
import RxSwift

/// NetworkManager - Base functions to handle network layer
protocol NetworkManager {
    func makeRequest(target: TargetType) -> Single<Response>
    static func getBaseUrl() -> String
}

class NetworkManagerImplementation: NetworkManager {

    private let provider: MoyaProvider<MultiTarget>

    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }

    func makeRequest(target: TargetType) -> Single<Response> {
        return self.provider.rx.request(MultiTarget(target))
    }

    static func getBaseUrl() -> String {
        return Config.getBaseUrl()
    }
}
