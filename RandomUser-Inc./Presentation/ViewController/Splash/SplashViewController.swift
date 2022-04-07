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
    func displayError(error: AppError)
}

class SplashViewController: BaseViewController<SplashPresenter> {

    // MARK: Outlets
    @IBOutlet weak var splashAnimationView: AnimationView!
    @IBOutlet weak var errorDescriptionLabel: UILabel!
    @IBOutlet weak var errorRetryButton: UIButton!

    // MARK: Actions

    @IBAction func retryButtonTapped(_ sender: Any) {
        presenter.refetchFirstPage()
    }

    // MARK: UIViewController

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
        errorDescriptionLabel.font = UIFont.largeTitle
        errorDescriptionLabel.textColor = .black
        errorDescriptionLabel.alpha = 0.0
        errorRetryButton.tintColor = UIColor.darkBrown
        errorRetryButton.titleLabel?.font = UIFont.appButton
        errorRetryButton.setTitle("app.retry".localized(), for: .normal)
        errorRetryButton.alpha = 0.0
    }

}

extension SplashViewController: SplashView {

    func animate() {
        splashAnimationView.play { _ in
            self.presenter.navigateHomeIfReady()
        }
    }

    func displayError(error: AppError) {
        splashAnimationView.stop()
        splashAnimationView.animation = Animation.named("splash_error_animation")
        splashAnimationView.loopMode = .playOnce
        splashAnimationView.play()
        errorDescriptionLabel.text = error.localizedDescription
        errorDescriptionLabel.alpha = 1.0
        errorRetryButton.alpha = 1.0
    }

}
