//
//  MockNetworkManager.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import RxSwift
import Moya

class MockNetworkManagerImplementation: NetworkManager {
    
    private let provider: MoyaProvider<MultiTarget>
    
    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    
    var makeRequestCalled: Bool = false
    func makeRequest(target: TargetType) -> Single<Response> {
        self.makeRequestCalled = true
        return Single.error(NSError(domain: "", code: 0))
    }

    static var mockBaseUrl = "mockBaseUrl"
    static var getBaseUrlCalled: Bool = false
    static func getBaseUrl() -> String {
        getBaseUrlCalled = true
        return mockBaseUrl
    }
    
    
}
