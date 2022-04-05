//
//  SplashViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import UIKit

protocol SplashView: BaseView {

}

class SplashViewController: BaseViewController<SplashPresenter> {

    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: SplashViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleLabel.text = "Edited"
    }

}

extension SplashViewController: SplashView {

}
