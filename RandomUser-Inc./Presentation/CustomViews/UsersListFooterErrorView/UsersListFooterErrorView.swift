//
//  UsersListFooterErrorView.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation
import UIKit
import Lottie

protocol UsersListFooterErrorViewDelegate: AnyObject {
    func retryLastFetch()
}

class UsersListFooterErrorView: UIView {

    // MARK: Outlets

    @IBOutlet weak var errorAnimationView: AnimationView!
    @IBOutlet weak var errorTitleLabel: UILabel!
    @IBOutlet weak var errorRetryButton: UIButton!

    // MARK: Actions

    @IBAction func retryButtonTapped(_ sender: Any) {
        self.delegate?.retryLastFetch()
    }

    // MARK: Public variables

    var delegate: UsersListFooterErrorViewDelegate?

    // MARK: UIView

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibFor(UsersListFooterErrorView.self)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibFor(UsersListFooterErrorView.self)
        setupView()
    }

    // MARK: Public methods

    func setup(error: AppError) {
        errorAnimationView.play()
        errorTitleLabel.text = error.localizedDescription
    }

    // MARK: Private methods

    private func setupView() {
        errorAnimationView.contentMode = .scaleAspectFit
        errorAnimationView.animation = Animation.named("error_animation")
        errorAnimationView.loopMode = .playOnce
        Style.app.apply(textStyle: .title, to: errorTitleLabel)
        errorRetryButton.tintColor = UIColor.darkBrown
        errorRetryButton.titleLabel?.font = UIFont.appButton
        errorRetryButton.setTitle("app.retry".localized(), for: .normal)
    }

}
