//
//  UsersListHeaderView.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 6/4/22.
//

import Foundation
import UIKit

protocol UsersListHeaderViewDelegate: AnyObject {
    func searchUsers(filter: String)
}

class UsersListHeaderView: UIView {

    // MARK: Outlets

    @IBOutlet weak var usersSearchBar: UISearchBar!

    // MARK: Public variables

    var delegate: UsersListHeaderViewDelegate?

    // MARK: UIView

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibFor(UsersListHeaderView.self)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibFor(UsersListHeaderView.self)
        setup()
    }

    // MARK: Private methods

    private func setup() {
        usersSearchBar.backgroundColor = UIColor.clear
        usersSearchBar.backgroundImage = UIImage()
        usersSearchBar.placeholder = "userlist.searchbar.placeholder".localized()
        usersSearchBar.tintColor = UIColor.lightBrown
        usersSearchBar.searchTextField.font = UIFont.cellInfo
        usersSearchBar.delegate = self
        usersSearchBar.searchTextField.delegate = self
    }
}

extension UsersListHeaderView: UISearchBarDelegate, UITextFieldDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            self.usersSearchBar.resignFirstResponder()
        }
        self.delegate?.searchUsers(filter: searchBar.text ?? "")
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.delegate?.searchUsers(filter: "")
        DispatchQueue.main.async {
            self.usersSearchBar.resignFirstResponder()
        }
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.delegate?.searchUsers(filter: "")
        DispatchQueue.main.async {
            self.usersSearchBar.resignFirstResponder()
        }
        return true
    }

}
