//
//  RandomAPIRepository.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import RxSwift
import Moya

protocol RandomAPIRepository: BaseRepository {
    func getRandomUsers(usersToLoad: Int, seed: String?, page: Int?) -> Single<UserResponse>
    func updateUser(user: User) -> User?
    func searchUsers(filter: String) -> Single<[User]>
}

class RandomAPIRepositoryImplementation: BaseRepositoryImplementation, RandomAPIRepository {

    func getRandomUsers(usersToLoad: Int, seed: String? = nil, page: Int? = nil) -> Single<UserResponse> {
        if let localUserResponse = self.getLocalManager().getRandomUsersResponse(page: page, seed: seed) {
            return Single.just(localUserResponse)
        }
        // swiftlint:disable:next line_length
        return getNetworkManager().makeRequest(target: RandomAPITarget.randomUsers(request: RandomUsersRequest(usersToLoad: usersToLoad, seed: seed, page: page)))
            .filterErrors()
            .map(UserResponseEntity.self)
            .flatMap({ (response) -> Single<UserResponse> in
                let model = response.parseToModel()
                self.getLocalManager().saveRandomUsersResponse(model)
                return Single.just(model)
            })

    }

    func updateUser(user: User) -> User? {
        return self.getLocalManager().updateUser(user: user)
    }

    func searchUsers(filter: String) -> Single<[User]> {
        return self.getLocalManager().getUsersByFilter(filter: filter)
    }

}
