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

    }

}
