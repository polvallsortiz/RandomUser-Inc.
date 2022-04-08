//
//  RepositoryInjection.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import Swinject

protocol RepositoryInjectionProtocol {
    func registerRepositories(container: Container)
}

class RepositoryInjection: RepositoryInjectionProtocol {

    func registerRepositories(container: Container) {
        container.register(UserDefaultsRepository.self) { _ in
            UserDefaultsRepositoryImplementation(defaults: .standard)
        }
        container.register(DatabaseRepository.self) { _ in
            DatabaseRepositoryImplementation()
        }
        container.register(BaseRepository.self) { resolver in
            BaseRepositoryImplementation(localManager: resolver.resolve(LocalManager.self)!,
                                         networkManager: resolver.resolve(NetworkManager.self)!)
        }
        container.register(RandomAPIRepository.self) { resolver in
            RandomAPIRepositoryImplementation(localManager: resolver.resolve(LocalManager.self)!,
                                              networkManager: resolver.resolve(NetworkManager.self)!)
        }
    }

}
