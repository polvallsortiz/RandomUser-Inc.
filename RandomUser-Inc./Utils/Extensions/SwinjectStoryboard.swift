//
//  SwinjectStoryboard.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {

    @objc class func setup() {
        ManagerInjection().registerManagers(container: defaultContainer)
        RepositoryInjection().registerRepositories(container: defaultContainer)
        InteractorInjection().registerInteractors(container: defaultContainer)
        RouterInjection().registerRouter(container: defaultContainer)
        PresenterInjection().registerPresenters(container: defaultContainer)
        ViewInjection().registerViews(container: defaultContainer)
    }

}
