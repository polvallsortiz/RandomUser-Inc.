//
//  RouterInjection.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import Swinject

protocol RouterInjectionProtocol {
    func registerRouter(container: Container)
}

class RouterInjection: RouterInjectionProtocol {

    func registerRouter(container: Container) {
        container.register(Router.self) { _ in
            RouterImplementation()
        }.inObjectScope(.container)
    }
}
