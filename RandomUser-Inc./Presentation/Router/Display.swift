//
//  Display.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import UIKit

final class Display {

    private let viewController: UIViewController
    private let modal: Bool
    private let animated: Bool

    init(viewController: UIViewController,
         modal: Bool,
         animated: Bool) {
        self.viewController = viewController
        self.modal = modal
        self.animated = animated
    }

    func get() -> UIViewController {
        return self.viewController
    }

    func show(animated: Bool, from parent: UIViewController? = nil) {
        let animated = animated
        if modal {
            presentViewController(viewController: viewController, animated: animated, parent: parent)
        } else {
            pushViewController(viewController: viewController, animated: animated, parent: parent)
        }
    }

    private func presentViewController(viewController: UIViewController, animated: Bool, parent: UIViewController? = nil) {
        if let parent = parent {
            parent.present(viewController, animated: animated)
        } else {
            UIApplication.topViewController()?.present(viewController, animated: animated)
        }
    }

    private func pushViewController(viewController: UIViewController, animated: Bool, parent: UIViewController? = nil) {
        var viewController = viewController
        if let parent = parent {
            parent.navigationController?.pushViewController(viewController, animated: animated)
        } else {
            if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController {
                if let navigationControllerViewController = viewController as? UINavigationController,
                   let lastViewNavigationController = navigationControllerViewController.viewControllers.last {
                    viewController = lastViewNavigationController
                }
                navigationController.pushViewController(viewController, animated: animated)
            } else {
                presentViewController(viewController: viewController, animated: animated)
            }
        }
    }
}
