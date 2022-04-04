//
//  MockBaseRepository.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

@testable import RandomUser_Inc_
import Foundation

class MockBaseRepositoryImplementation: BaseRepository {
    
    var mockNetworkManager: NetworkManager
    var mockLocalManager: LocalManager
    
    init(mockNetworkManager: NetworkManager, mockLocalManager: LocalManager) {
        self.mockNetworkManager = mockNetworkManager
        self.mockLocalManager = mockLocalManager
    }
    
    var getNetworkManagerCalled: Bool = false
    func getNetworkManager() -> NetworkManager {
        self.getNetworkManagerCalled = true
        return self.mockNetworkManager
    }
    
    var getLocalManagerCalled: Bool = false
    func getLocalManager() -> LocalManager {
        self.getLocalManagerCalled = true
        return self.mockLocalManager
    }
}
