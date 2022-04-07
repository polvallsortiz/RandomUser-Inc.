//
//  SplashPresenter.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

class SplashPresenter: BasePresenter {

    internal var view: SplashView? {
        return baseView as? SplashView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router.usersList()
        }
    }
}
