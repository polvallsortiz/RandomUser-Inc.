//
//  AppDelegate.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import UIKit
import SwinjectStoryboard

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let configuration = Bundle.main.infoDictionary?["Configuration"] as? String {
            print("CONFIGURATION \(configuration)")
        }

        startNavigationIfNotTesting()

        return true
    }
    
    private func startNavigationIfNotTesting() {
        guard NSClassFromString("XCTestCase") != nil else {
            guard let router = SwinjectStoryboard.defaultContainer.resolve(Router.self) else { return }
            router.start()
            return
        }
    }

}
