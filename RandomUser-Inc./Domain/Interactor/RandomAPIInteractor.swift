//
//  RandomAPIInteractor.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RxSwift

protocol RandomAPIInteractor {
    func getRandomUsers(usersToLoad: Int, seed: String?, page: Int?) -> Single<UserResponse>
    func updateUser(user: User) -> User?
}

class RandomAPIInteractorImplementation: RandomAPIInteractor {

    private var randomAPIRepository: RandomAPIRepository

    init(randomAPIRepository: RandomAPIRepository) {
        self.randomAPIRepository = randomAPIRepository
    }

    func getRandomUsers(usersToLoad: Int, seed: String? = nil, page: Int? = nil) -> Single<UserResponse> {
        return randomAPIRepository.getRandomUsers(usersToLoad: usersToLoad, seed: seed, page: page)
    }

    func updateUser(user: User) -> User? {
        return randomAPIRepository.updateUser(user: user)
    }
}
