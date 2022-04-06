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
    private var users: [User] = []
    private var currentPageInfo: UserResponseInfo?
    private var currentPage = 1
    private var total = 0
    private var fetching: Bool = false

    var totalCount: Int {
        return total
    }

    var currentCount: Int {
        return users.count
    }

    var isFetching: Bool {
        return fetching
    }

    func user(at index: Int) -> User {
        return users[index]
    }

    init(router: Router, randomAPIInteractor: RandomAPIInteractor) {
        self.randomAPIInteractor = randomAPIInteractor
        super.init(router: router)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view?.showLoader(model: Loader(title: "Getting latest users"))
        self.getUsers(page: self.currentPage)
    }

    func fetchNewPage() {
        getUsers(page: currentPage + 1)
    }

    private func getUsers(page: Int) {
        self.fetching = true
        randomAPIInteractor.getRandomUsers(usersToLoad: Config.getPageLength(), seed: currentPageInfo?.seed, page: page)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onSuccess: { response in
                self.currentPage += 1
                self.currentPageInfo = response.info
                self.users.append(contentsOf: response.users)
                self.total += response.users.count
                self.fetching = false
                self.view?.refreshUsers()
            }, onFailure: { error in
                self.fetching = false
                print(error)
            }).disposed(by: self.disposeBag)

    }

}
