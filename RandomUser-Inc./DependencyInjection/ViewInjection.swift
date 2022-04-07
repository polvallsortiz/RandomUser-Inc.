//
//  ViewInjection.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import Swinject

protocol ViewInjectionProtocol {
    func registerViews(container: Container)
}

class ViewInjection: ViewInjectionProtocol {

    func registerViews(container: Container) {

        container.register(SplashViewController.self) { resolver in
            let view = SplashViewController()
            view.presenter = resolver.resolve(SplashPresenter.self)!
            return view
        }

        container.register(UsersListViewController.self) { (resolver, firstPage: UserResponse) in
            let view = UsersListViewController()
            view.presenter = resolver.resolve(UsersListPresenter.self, argument: firstPage)!
            return view
        }

        container.register(UserDetailViewController.self) { resolver in
            let view = UserDetailViewController()
            view.presenter = resolver.resolve(UserDetailPresenter.self)!
            return view
        }

    }

}
