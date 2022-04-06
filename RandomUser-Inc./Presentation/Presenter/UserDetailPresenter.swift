//
//  UserDetailPresenter.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation

class UserDetailPresenter: BasePresenter {

    // MARK: BasePresenter
    internal var view: UserDetailView? {
        return baseView as? UserDetailView
    }

    override init(router: Router) {
        super.init(router: router)
    }

}
