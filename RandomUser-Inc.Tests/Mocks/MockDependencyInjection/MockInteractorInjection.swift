//
//  MockInteractorInjection.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import Swinject

class MockInteractorInjection: InteractorInjection {

    override func registerInteractors(container: Container) {
        
        container.register(RandomAPIInteractor.self) { resolver in
            MockRandomAPIInteractorImplementation(mockRandomAPIRepository: resolver.resolve(RandomAPIRepository.self)!)
        }

    }

}

