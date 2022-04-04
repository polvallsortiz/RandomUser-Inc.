//
//  MockRouterInjection.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import Swinject

class MockRouterInjection: RouterInjection {

    override func registerRouter(container: Container) {
        container.register(Router.self) { _ in
            MockRouter()
        }.inObjectScope(.container)
    }

}
