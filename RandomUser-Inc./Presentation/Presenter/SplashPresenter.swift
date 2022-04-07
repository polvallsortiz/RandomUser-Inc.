//
//  SplashPresenter.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation

class SplashPresenter: BasePresenter {

    // MARK: BasePresenter

    internal var view: SplashView? {
        return baseView as? SplashView
    }

    init(router: Router, randomAPIInteractor: RandomAPIInteractor) {
        self.randomAPIInteractor = randomAPIInteractor
        super.init(router: router)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.view?.animate()
        }
        self.fetchFirstPage()
    }

    // MARK: Private variables

    private let randomAPIInteractor: RandomAPIInteractor
    private var firstPageResponse: UserResponse?

    // MARK: Public methods

    func navigateHomeIfReady() {
        if let firstPageResponse = firstPageResponse {
            self.router.usersList(firstPage: firstPageResponse)
        } else {
            self.view?.animate()
        }
    }

    func refetchFirstPage() {
        fetchFirstPage()
    }

    // MARK: Private methods

    private func fetchFirstPage() {
        randomAPIInteractor.getRandomUsers(usersToLoad: Config.getPageLength(), seed: nil, page: 1).subscribe(onSuccess: { response in
            self.firstPageResponse = response
        }, onFailure: { error in
            DispatchQueue.main.async {
                self.view?.displayError(error: error as? AppError ?? AppError.general)
            }
            print(error.localizedDescription)
        }).disposed(by: self.disposeBag)
    }
}
