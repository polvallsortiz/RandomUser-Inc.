//
//  PresenterInjection.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import Swinject

protocol PresenterInjectionProtocol {
    func registerPresenters(container: Container)
}

class PresenterInjection: PresenterInjectionProtocol {

    func registerPresenters(container: Container) {

        container.register(SplashPresenter.self) { resolver in
            SplashPresenter(router: resolver.resolve(Router.self)!)
        }

        container.register(UsersListPresenter.self) { resolver in
            UsersListPresenter(router: resolver.resolve(Router.self)!,
                               randomAPIInteractor: resolver.resolve(RandomAPIInteractor.self)!)
        }

    }

}
