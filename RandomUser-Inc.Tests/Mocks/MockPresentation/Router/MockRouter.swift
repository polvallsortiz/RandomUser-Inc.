//
//  MockRouter.swift
//  RandomUser-Inc.Tests
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

@testable import RandomUser_Inc_
import Foundation
import UIKit

class MockRouter: Router {

    var startCalled: Bool = false
    func start() {
        self.startCalled = true
    }

    var usersListCalled: Bool = false
    func usersList() -> Display {
        usersListCalled = true
        return Display(viewController: UIViewController() , modal: false, animated: false)
    }
    
    var popCurrentDisplayCalled: Bool = false
    func popCurrentDisplay(animated: Bool, completion: (() -> Void)?) {
        self.popCurrentDisplayCalled = true
    }
    
    var popToViewControllerCalled: Bool = false
    func popToViewContoller(vc: UIViewController.Type, animated: Bool) {
        self.popToViewControllerCalled = true
    }
    
    var dismissViewControllerCalled: Bool = false
    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        self.dismissViewControllerCalled = true
    }
    
    var popToRootCalled: Bool = false
    func popToRoot(animated: Bool) {
        self.popToRootCalled = true
    }

}
