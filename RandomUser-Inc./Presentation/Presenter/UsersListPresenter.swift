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
    private var currentPage = 1
    private var total = 0

    var totalCount: Int {
        return total
    }

    var currentCount: Int {
        return users.count
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
        getUsers(page: currentPage)
    }

    func fetchNewPage() {
        getUsers(page: currentPage + 1)
    }

    private func getUsers(page: Int) {

        randomAPIInteractor.getRandomUsers(usersToLoad: Config.getPageLength(), seed: nil, page: page)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onSuccess: { response in
                self.currentPage += 1
                self.users.append(contentsOf: response.users)
                self.total += response.users.count
                self.view?.usersReady()
            }, onFailure: { error in
                print(error)
            }).disposed(by: self.disposeBag)

    }

    private func calculateIndexPathsToReaload(newUsers: [User]) -> [IndexPath] {
        let startIndex = users.count - newUsers.count
        let endIndex = startIndex + newUsers.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }

}
