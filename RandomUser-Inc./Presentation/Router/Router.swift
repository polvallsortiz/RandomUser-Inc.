//
//  Router.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import Swinject
import SwinjectStoryboard

protocol Router {
    func start()
    // Add views here
    func usersList(firstPage: UserResponse)
    func userDetail(user: User) -> Display
    func popCurrentDisplay(animated: Bool, completion: (() -> Void)?)
    func popToViewContoller(vc: UIViewController.Type, animated: Bool)
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)
}

final class RouterImplementation: Router {

    func start() {
        guard let viewController = SwinjectStoryboard.defaultContainer.resolve(SplashViewController.self) else {
            fatalError("COULD NOT INSTANTIATE SPLASHVIEWCONTROLLER")
        }
        let navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.keyWindow?.replaceRootViewControllerWith(navController, animated: true, completion: nil)
    }

    // MARK: View methods

    func usersList(firstPage: UserResponse) {
        guard let viewController = SwinjectStoryboard.defaultContainer.resolve(UsersListViewController.self, argument: firstPage) else {
            fatalError("COULD NOT INSTANTIATE USERSLISTVIEWCONTROLLER")
        }
        let navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(false, animated: true)
        navController.navigationBar.tintColor = UIColor.black
        navController.navigationBar.backgroundColor = UIColor.clear
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.navBarLargeTitle]
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.navBarTitle]
        UIApplication.shared.keyWindow?.replaceRootViewControllerWith(navController, animated: true, completion: nil)
    }

    func userDetail(user: User) -> Display {
        guard let viewController = SwinjectStoryboard.defaultContainer.resolve(UserDetailViewController.self) else {
            fatalError("COULD NOT INSTANTIATE USERLISTVIEWCONTROLLER")
        }
        viewController.loadView()
        viewController.setup(user: user)
        return Display(viewController: viewController, modal: true, animated: true)
    }

    // MARK: Navigation methods

    func popCurrentDisplay(animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController,
               navigationController.viewControllers.count > 1 {
                if completion != nil {
                    navigationController.popViewController(animated: animated)
                } else {
                    navigationController.popViewController(animated: animated)
                    return
                }
            } else {
                UIApplication.topViewController()?.dismiss(animated: animated, completion: completion)
            }
        }
    }

    func popToViewContoller(vc: UIViewController.Type, animated: Bool = true) {
        guard let nav = UIApplication.topViewController()?.parent as? UINavigationController else { return }
        for controller in nav.viewControllers {
            if controller.isKind(of: vc) {
                nav.popToViewController(controller, animated: animated)
                return
            }
        }
    }

    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        guard let vc = UIApplication.topViewController()
        else { return }
        vc.dismiss(animated: animated, completion: completion)
    }

    func popToRoot(animated: Bool = true) {
        guard let nav  = UIApplication.topViewController()?.parent as? UINavigationController
        else { return }
        nav.popToRootViewController(animated: animated)
    }

    internal static func getWindow() -> UIWindow {

        // swiftlint:disable:next force_cast
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        if appDelegate.window == nil {
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }

        return appDelegate.window!

    }

}
