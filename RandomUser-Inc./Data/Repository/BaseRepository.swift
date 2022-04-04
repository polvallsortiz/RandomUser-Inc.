//
//  BaseRepository.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation

/// BaseRepository - Creates a reposioty base which all repositories must inherit
protocol BaseRepository {
    func getLocalManager() -> LocalManager
    func getNetworkManager() -> NetworkManager
}

class BaseRepositoryImplementation: BaseRepository {

    private let localManager: LocalManager
    private let networkManager: NetworkManager

    init(localManager: LocalManager, networkManager: NetworkManager) {
        self.localManager = localManager
        self.networkManager = networkManager
    }

    func getLocalManager() -> LocalManager {
        return self.localManager
    }

    func getNetworkManager() -> NetworkManager {
        return self.networkManager
    }
}
