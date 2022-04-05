//
//  MockDependencyInjection.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import Swinject
import SwinjectStoryboard

class MockDependencyInjection {
    
    public static var defaultContainer = SwinjectStoryboard.defaultContainer
    public static var mockContainer = Container()
    
    static func mockDependencies() {
        MockManagerInjection().registerManagers(container: mockContainer)
        MockRepositoryInjection().registerRepositories(container: mockContainer)
        MockInteractorInjection().registerInteractors(container: mockContainer)
        MockRouterInjection().registerRouter(container: mockContainer)
        MockPresenterInjection().registerPresenters(container: mockContainer)
        MockViewInjection().registerViews(container: mockContainer)
    }

}
