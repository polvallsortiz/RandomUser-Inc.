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

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var userGenderView: UIView!
    @IBOutlet weak var userGenderTitleLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderImage: UIImageView!

    @IBOutlet weak var userLocationView: UIView!
    @IBOutlet weak var userLocationTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!

    @IBOutlet weak var userRegisteredView: UIView!
    @IBOutlet weak var userRegisteredTitleLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var registeredImage: UIImageView!

    // MARK: Private variables

    private var user: User?

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: UserDetailViewController.self)
        self.view.accessibilityIdentifier = "userDetailView"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Public methods

    func setup(user: User) {
        self.setupView()
        self.user = user
        backgroundMapView.region = MKCoordinateRegion(center: user.location.coordinates,
                                                      latitudinalMeters: CLLocationDistance(50),
                                                      longitudinalMeters: CLLocationDistance(50))
        backgroundMapView.isZoomEnabled = false
        backgroundMapView.isScrollEnabled = false
        backgroundMapView.isUserInteractionEnabled = false

        userAvatarImageView.sd_setImage(with: URL(string: user.picture.medium))
        userAvatarImageView.rounded()
        emailLabel.text = user.email
        nameLabel.text = user.name.first + " " + user.name.last

        userGenderTitleLabel.text = "user.detail.gender".localized()
        genderLabel.text = user.gender

        userLocationTitleLabel.text = "user.detail.location".localized()
        locationLabel.text = "\(user.location.street.name) \(user.location.street.number), \(user.location.city), \(user.location.state)"

        userRegisteredTitleLabel.text = "user.detail.registered".localized()
        registeredLabel.text = DateFormatter().defaultFormatter().string(from: user.registered.date)
    }

    // MARK: Private methods

    private func setupView() {
        self.view.backgroundColor = Style.detail.backgroundColor
        Style.detail.apply(textStyle: .title, to: nameLabel)
        Style.detail.apply(textStyle: .body, to: emailLabel)

        Style.detail.apply(textStyle: .subtitle, to: userGenderTitleLabel)
        Style.detail.apply(textStyle: .body, to: genderLabel)
        genderImage.image = UIImage(systemName: "person.crop.circle.fill")
        genderImage.tintColor = .appBlack

        Style.detail.apply(textStyle: .subtitle, to: userLocationTitleLabel)
        Style.detail.apply(textStyle: .body, to: locationLabel)
        locationImage.image = UIImage(systemName: "location.circle.fill")
        locationImage.tintColor = .appBlack

        Style.detail.apply(textStyle: .subtitle, to: userRegisteredTitleLabel)
        Style.detail.apply(textStyle: .body, to: registeredLabel)
        registeredImage.image = UIImage(systemName: "calendar.circle.fill")
        registeredImage.tintColor = .appBlack
    }

}
