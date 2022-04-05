//
//  UIWindow.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import UIKit

extension UIView {

    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }

}

extension UIWindow {

    func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let rootVC = self.rootViewController else {
            self.rootViewController = replacementController
            self.makeKeyAndVisible()
            return
        }

        let snapshotImageView = UIImageView(image: self.snapshot())
        self.addSubview(snapshotImageView)

        let dismissCompletion = { () -> Void in
            self.rootViewController = replacementController
            self.bringSubviewToFront(snapshotImageView)
            self.makeKeyAndVisible()
            if animated {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    snapshotImageView.alpha = 0
                }, completion: { _ -> Void in
                    snapshotImageView.removeFromSuperview()
                    completion?()
                })
            } else {
                snapshotImageView.removeFromSuperview()
                completion?()
            }
        }

        if rootVC.presentedViewController != nil {
            rootVC.dismiss(animated: false, completion: dismissCompletion)
        } else {
            dismissCompletion()
        }

    }

}
