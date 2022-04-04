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
    func startApp()
    // Add views here

    func popCurrentDisplay(animated: Bool, completion: (() -> Void)?)
    func popToViewContoller(vc: UIViewController.Type, animated: Bool)
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)
}

final class RouterImplementation: Router {

    func startApp() {

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

}
