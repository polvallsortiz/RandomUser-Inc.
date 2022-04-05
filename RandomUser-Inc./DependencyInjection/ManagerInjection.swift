//
//  ManagerInjection.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import Swinject
import Moya

protocol ManagerInjectionProtocol {
    func registerManagers(container: Container)
}

class ManagerInjection: ManagerInjectionProtocol {

    func registerManagers(container: Container) {

        container.register(LocalManager.self) { resolver in
            LocalManagerImplementation(userDefaultsRepository: resolver.resolve(UserDefaultsRepository.self)!,
                                       databaseRepository: resolver.resolve(DatabaseRepository.self)!)
        }

        container.register(NetworkManager.self) { _ in
            // swiftlint:disable:next line_length
            let provider = MoyaProvider<MultiTarget>(stubClosure: (NSClassFromString("XCTestCase") != nil) ? MoyaProvider.immediatelyStub : MoyaProvider.neverStub,
                                                     callbackQueue: DispatchQueue.main,
                                                     plugins: [NetworkLoggerPlugin()])
            return NetworkManagerImplementation(provider: provider)
        }
    }
}
