//
//  MockRepositoryInjection.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import Swinject

class MockRepositoryInjection: RepositoryInjectionProtocol {

    func registerRepositories(container: Container) {
        container.register(BaseRepository.self) { resolver in
            MockBaseRepositoryImplementation(mockNetworkManager: resolver.resolve(NetworkManager.self)!,
                                             mockLocalManager: resolver.resolve(LocalManager.self)!)
        }
    }

}
