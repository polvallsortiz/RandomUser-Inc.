//
//  UsersListPresenter.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import RxSwift

class UsersListPresenter: BasePresenter {

    internal var view: UsersListView? {
        return baseView as? UsersListView
    }

    private let randomAPIInteractor: RandomAPIInteractor
    private var users: [User]?

    init(router: Router, randomAPIInteractor: RandomAPIInteractor) {
        self.randomAPIInteractor = randomAPIInteractor
        super.init(router: router)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUsers()
    }

    private func getUsers() {

        randomAPIInteractor.getRandomUsers(usersToLoad: Config.getPageLength(), seed: nil, page: nil)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onSuccess: { response in
                self.users = response.users
                self.view?.setUsers(users: response.users)
            }, onFailure: { error in
                print(error)
            }).disposed(by: self.disposeBag)

    }

}
