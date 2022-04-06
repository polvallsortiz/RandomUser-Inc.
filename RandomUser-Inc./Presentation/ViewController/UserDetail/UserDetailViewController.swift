//
//  UserDetailViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation
import UIKit
import MapKit
import SDWebImage

protocol UserDetailView: BaseView {

}

class UserDetailViewController: BaseViewController<UserDetailPresenter> {

    // MARK: Outlets
    @IBOutlet weak var backgroundMapView: MKMapView!
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userTitleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userGenderTitleLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var userLocationTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var userRegisteredTitleLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!

    // MARK: Private variables

    private var user: User?

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: UserDetailViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    // MARK: Public methods

    func setup(user: User) {
        self.user = user
        backgroundMapView.region = MKCoordinateRegion(center: user.location.coordinates,
                                                      latitudinalMeters: CLLocationDistance(0.1),
                                                      longitudinalMeters: CLLocationDistance(0.1))
        userAvatarImageView.sd_setImage(with: URL(string: user.picture.medium))
        userAvatarImageView.rounded()
        userTitleLabel.text = "User:"
        emailLabel.text = user.email
        nameLabel.text = user.name.first + " " + user.name.last
        userGenderTitleLabel.text = "Gender:"
        genderLabel.text = user.gender
        userLocationTitleLabel.text = "Location:"
        locationLabel.text = "\(user.location.street.name) \(user.location.street.number), \(user.location.city), \(user.location.state)"
        userRegisteredTitleLabel.text = "Registered:"
        registeredLabel.text = ISO8601DateFormatter().defaultFormatter().string(from: user.registered.date)
    }

    // MARK: Private methods

    private func setupView() {

    }
}
