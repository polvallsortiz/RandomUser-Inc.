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
    private var filteredUsers: [User] = []
    private var users: [User] = [] {
        didSet {
            filteredUsers = users.filter({ !$0.deleted })
        }
    }
    private var currentPageInfo: UserResponseInfo?
    private var currentPage = 1
    private var total = 0
    private var fetching: Bool = false

    var totalCount: Int {
        return total
    }

    var currentCount: Int {
        return filteredUsers.count
    }

    var isFetching: Bool {
        return fetching
    }

    func user(at index: Int) -> User {
        return filteredUsers[index]
    }

    func deleteUser(at index: Int) {
        var user = filteredUsers[index]
        user.deleted = true
        if let updatedUser = randomAPIInteractor.updateUser(user: user) {
            if let usersIndex = users.firstIndex(where: { $0.id.uuid == updatedUser.id.uuid }) {
                users[usersIndex] = updatedUser
            }
        }
    }

    init(router: Router, randomAPIInteractor: RandomAPIInteractor) {
        self.randomAPIInteractor = randomAPIInteractor
        super.init(router: router)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
