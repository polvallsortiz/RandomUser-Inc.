//
//  UsersListTableViewCell.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import UIKit
import SDWebImage

struct UsersListTableViewCellViewModel {

    var avatarUrl: String
    var name: String
    var surname: String
    var email: String
    var phone: String
    var displayName: String {
        return name + " " + surname
    }

    init(avatarUrl: String,
         name: String,
         surname: String,
         email: String,
         phone: String) {
        self.avatarUrl = avatarUrl
        self.name = name
        self.surname = surname
        self.email = email
        self.phone = phone
    }

    init(user: User) {
        self.avatarUrl = user.picture.medium
        self.name = user.name.first
        self.surname = user.name.last
        self.email = user.email
        self.phone = user.phone
    }

}

class UsersListTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    // MARK: Private variables

    var model: UsersListTableViewCellViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: Public methods

    func setup(model: UsersListTableViewCellViewModel) {
        self.model = model
        self.setupContent()
    }

    override func prepareForReuse() {
        self.avatarImageView.image = nil
        self.nameLabel.text = nil
        self.emailLabel.text = nil
        self.phoneLabel.text = nil
    }

    // MARK: Private methods

    private func setupCell() {
        self.selectionStyle = .none
        containerView.backgroundColor = UIColor.lightBrown
        containerView.layer.cornerRadius = 10
        avatarImageView.layer.cornerRadius = 10
        Style.cells.apply(textStyle: .title, to: nameLabel)
        Style.cells.apply(textStyle: .subtitle, to: emailLabel)
        Style.cells.apply(textStyle: .body, to: phoneLabel)
        self.layoutIfNeeded()
    }

    private func setupContent() {
        if let model = model {
            avatarImageView.sd_setImage(with: URL(string: model.avatarUrl), placeholderImage: UIImage(named: "avatar-placeholder"))
            avatarImageView.layer.cornerRadius = 10
            nameLabel.text = model.displayName
            emailLabel.text = model.email
            phoneLabel.text = model.phone
        }
    }

}
