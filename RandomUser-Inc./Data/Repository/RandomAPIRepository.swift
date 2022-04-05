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

}

class RandomAPIRepositoryImplementation: BaseRepositoryImplementation, RandomAPIRepository {

    func getRandomUsers(usersToLoad: Int, seed: String? = nil, page: Int? = nil) -> Single<UserResponse> {
        // swiftlint:disable:next line_length
        return getNetworkManager().makeRequest(target: RandomAPITarget.randomUsers(request: RandomUsersRequest(usersToLoad: usersToLoad, seed: seed, page: page)))
            .map(UserResponseEntity.self)
            .flatMap({ (response) -> Single<UserResponse> in
                return Single.just(response.parseToModel())
            })

    }
}
