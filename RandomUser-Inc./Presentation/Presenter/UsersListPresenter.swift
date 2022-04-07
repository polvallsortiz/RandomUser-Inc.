//
//  UsersListPresenter.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import RxSwift

class UsersListPresenter: BasePresenter {

    // MARK: BasePresenter

    internal var view: UsersListView? {
        return baseView as? UsersListView
    }

    init(router: Router,
         randomAPIInteractor: RandomAPIInteractor,
         firstResponse: UserResponse) {
        self.randomAPIInteractor = randomAPIInteractor
        self.currentResponse = firstResponse
        self.users = firstResponse.users
        self.filteredUsers = firstResponse.users.filter({ !$0.deleted })
        self.total = firstResponse.users.count
        self.currentPage = firstResponse.info.page
        super.init(router: router)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view?.refreshUsers()
    }

    // MARK: Private variables

    private let randomAPIInteractor: RandomAPIInteractor
    private var filteredUsers: [User]
    private var users: [User] = [] {
        didSet {
            filteredUsers = users.filter({ !$0.deleted })
        }
    }
    private var currentResponse: UserResponse {
        didSet {
            users.append(contentsOf: currentResponse.users)
            currentPage = currentResponse.info.page
            total += currentResponse.users.count
        }
    }
    private var currentPage: Int
    private var total: Int
    private var fetching: Bool = false

    // MARK: Public variables

    var totalCount: Int {
        return total
    }

    var currentCount: Int {
        return filteredUsers.count
    }

    var isFetching: Bool {
        return fetching
    }

    // MARK: Public methods

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

    func fetchNewPage() {
        getUsers(page: currentPage + 1)
    }

    func searchUsers(filter: String) {
        randomAPIInteractor.searchUsers(filter: filter)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onSuccess: { response in
                self.users = response
                self.view?.refreshUsers()
            }).disposed(by: self.disposeBag)
    }

    // MARK: Private methods

    private func getUsers(page: Int) {
        self.fetching = true
        randomAPIInteractor.getRandomUsers(usersToLoad: Config.getPageLength(), seed: currentResponse.info.seed, page: page)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onSuccess: { response in
                self.currentResponse = response
                self.fetching = false
                self.view?.refreshUsers()
            }, onFailure: { error in
                self.fetching = false
                print(error)
            }).disposed(by: self.disposeBag)
    }

}
