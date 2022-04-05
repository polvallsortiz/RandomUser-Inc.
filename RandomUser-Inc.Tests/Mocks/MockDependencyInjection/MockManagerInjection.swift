//
//  MockManagerInjection.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import Swinject
import Moya

class MockManagerInjection: ManagerInjectionProtocol {

    func registerManagers(container: Container) {

        container.register(LocalManager.self) { _ in
            MockLocalManagerImplementation()
        }

        container.register(NetworkManager.self) { _ in
            let provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub,
                                                     callbackQueue: DispatchQueue.main,
                                                     plugins: [NetworkLoggerPlugin()])
            return MockNetworkManagerImplementation(provider: provider)
        }

    }
}
