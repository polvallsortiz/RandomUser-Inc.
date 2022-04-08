//
//  InteractorInjection.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import Swinject

protocol InteractorInjectionProtocol {
    func registerInteractors(container: Container)
}

class InteractorInjection: InteractorInjectionProtocol {

    func registerInteractors(container: Container) {
        container.register(RandomAPIInteractor.self) { resolver in
            RandomAPIInteractorImplementation(randomAPIRepository: resolver.resolve(RandomAPIRepository.self)!)
        }
    }

}
