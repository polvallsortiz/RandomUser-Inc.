//
//  LocalManager.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation

/// LocalManager - Base functions to handle local data in device
protocol LocalManager {
    
}

class LocalManagerImplementation: LocalManager {
    private let userDefaultsRepository: UserDefaultsRepository
    private let databaseRepository: DatabaseRepository
    
    init(userDefaultsRepository: UserDefaultsRepository, databaseRepository: DatabaseRepository) {
        self.userDefaultsRepository = userDefaultsRepository
        self.databaseRepository = databaseRepository
    }
    
}
