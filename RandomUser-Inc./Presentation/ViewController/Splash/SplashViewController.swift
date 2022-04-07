//
//  SplashViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 4/4/22.
//

import UIKit
import Lottie

protocol SplashView: BaseView {
    func animate()
}

class SplashViewController: BaseViewController<SplashPresenter> {

    // MARK: Outlets
    @IBOutlet weak var splashAnimationView: AnimationView!

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: SplashViewController.self)
        self.view.accessibilityIdentifier = "splashView"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: Private methods

    private func setupView() {
        self.view.backgroundColor = UIColor.superLightBrown
        splashAnimationView.contentMode = .scaleAspectFit
        splashAnimationView.animation = Animation.named("splash_animation")
        splashAnimationView.loopMode = .playOnce
    }

}

extension SplashViewController: SplashView {
    func animate() {
        splashAnimationView.play { _ in
            self.presenter.navigateHomeIfReady()
        }
    }
}
