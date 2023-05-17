//
//  GlobalConstants.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 16/02/23.
//

import Foundation
import UIKit

let blankString: String = ""




//MARK: - App custom colors.
let appBlueColor = UIColor(red: 0/255, green: 56/255, blue: 116/255, alpha: 1)
let appRedColor = UIColor(red: 237/255, green: 28/255, blue: 36/255, alpha: 1)
let appGrayColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)




//MARK: - Enum for tab bar button type.
enum ButtonType: String {
    case all = "All"
    case favourites = "Favourites"
}




//MARK: - Properties styling constants.
let mainButtonTitle: String = "Launch"
let mainButtonCornerRadius: CGFloat = 10
let mainButtonTintColor: UIColor = .white

let navBarTitle: String = "Add/Manage Beneficiary"
let navigationControllerNavigationBarTintColor: UIColor = .white

let tabViewBackgroundColor: UIColor = .white

let allButtonTitle: String = ButtonType.all.rawValue
let allButtonTitleColor: UIColor = .black
let allButtonFontSize: UIFont = UIFont.boldSystemFont(ofSize: 17)

let favouritesButtonTitle: String = ButtonType.favourites.rawValue
let favouritesButtonTitleColor: UIColor = .black
let favouritesButtonFontSize: UIFont = UIFont.boldSystemFont(ofSize: 17)

let underlineViewBackgroundColor: UIColor = .red

let addButtonTitle: String = "Add"
let addButtonTitleColor: UIColor = appRedColor
let addButtonFontSize: UIFont = UIFont.boldSystemFont(ofSize: 17)
let addButtonImage: String = "person.badge.plus"

let searchBarPlaceholder: String = "Search beneficiary nickname"
let searchBarCornerRadius: CGFloat = 10
let searchBarClipsToBounds: Bool = true

let tableViewCornerRadius: CGFloat = 10
let tableViewSeparatorInset: UIEdgeInsets = .zero

let tableViewHeaderLabelText: String = "My Beneficiaries"
let tableViewHeaderLabelFontSize: UIFont = UIFont.boldSystemFont(ofSize: 20)

let beneficiaryNotFoundErrorLabelText: String = "Beneficiary not found!"
let beneficiaryNotFoundErrorLabelTextColor: UIColor = .red
let beneficiaryNotFoundErrorLabelFontSize: UIFont = UIFont.systemFont(ofSize: 16)

let profilePictureImage: String = "person.crop.circle.fill"
let favouriteIconImage: String = "star.fill"
let unfavouriteIconImage: String = "star"

let cellStackViewSpacing: CGFloat = 20
let cellStackViewAxis: NSLayoutConstraint.Axis = .vertical

let profileImageViewContentMode: UIView.ContentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally

let nameLabelFontSize: UIFont = UIFont.systemFont(ofSize: 20)

let detailsLabelFontSize: UIFont = UIFont.systemFont(ofSize: 12)
let detailsLabelTextColor: UIColor = .gray
let detailsLabelNumberOfLines: Int = 1
let detailsLabelLineBreakMode: NSLineBreakMode = .byTruncatingTail

let favouriteImageViewContentMode: UIView.ContentMode = .scaleAspectFit
let favouriteImageViewTintColor: UIColor = .gray

let tabBarCurrentButtonDefaultState: ButtonType = .all




//MARK: - Constraints constants.
let mainButtonWidthConstraint: CGFloat = 100
let mainButtonHeightConstraint: CGFloat = 50

let tabViewTopConstraint: CGFloat = 0
let tabViewHeightConstraint: CGFloat = 50

let allButtonLeadingConstraint: CGFloat = 10

let favouritesButtonLeadingConstraint: CGFloat = 1

let addButtonTrailingConstraint: CGFloat = -10

let searchBarTopConstraint: CGFloat = 10
let searchBarLeadingConstraint: CGFloat = 10
let searchBarTrailingConstraint: CGFloat = -10

let tableViewTopConstraint: CGFloat = 10

let tableViewHeaderLabelLeadingConstraint: CGFloat = 16
let tableViewHeaderLabelBottomConstraint: CGFloat = -12

let cellStackViewLeadingConstraint: CGFloat = 10
let cellStackViewTrailingConstraint: CGFloat = -10
let cellStackViewHeightConstraint: CGFloat = 40

let profileImageViewLeadingConstraint: CGFloat = 10
let profileImageViewWidthConstraint: CGFloat = 60
let profileImageViewHeightConstraint: CGFloat = 60

let detailsLabelTopConstraint: CGFloat = 10
let detailsLabelTrailingConstraint: CGFloat = -50

let favouriteImageViewLeadingConstraint: CGFloat = -50
let favouriteImageViewWidthConstraint: CGFloat = 45
let favouriteImageViewHeightConstraint: CGFloat = 45




//MARK: - Accessibilty constants.
let navigationItemAccessibilityLabel = "navigation bar"

let tabViewAccessibilityLabel: String = "Tab bar"

let allButtonAccessibilityLabel: String = "All beneficiaries"

let favouritesButtonAccessibilityLabel: String = "Favourites beneficiaries"

let addButtonAccessibilityLabel: String = "Add beneficiary"

let searchBarAccessibilityLabel: String = "Beneficiary"

let profileImageViewAccessibilityLabel: String = "Beneficiary profile picture"
let profileImageViewAccessibilityTraits: UIAccessibilityTraits = .image

let nameLabelAccessibilityLabel: String = "Beneficiary name"

let detailsLabelAccessibilityLabel: String = "Beneficiary details"

let favouriteImageViewFavouriteAccessibilityLabel: String = "Beneficiary favourite icon"
let favouriteImageViewUnfavouriteAccessibilityLabel: String = "Beneficiary unfavourite icon"
let favouriteImageViewAccessibilityTraits: UIAccessibilityTraits = .image

