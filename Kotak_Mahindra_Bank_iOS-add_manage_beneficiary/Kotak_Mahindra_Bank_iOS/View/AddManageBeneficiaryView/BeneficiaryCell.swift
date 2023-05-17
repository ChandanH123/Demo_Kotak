//
//  BeneficiaryTableViewCell.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 08/02/23.
//

import UIKit

class BeneficiaryTableViewCell: UITableViewCell {
    
    //MARK: - didSet stored property
    var beneficiary: AddManageBeneficiaryUIModel? {
        didSet {
            
            guard let beneficiaryItem = beneficiary else {return}
            
            profileImageView.image = UIImage(systemName: profilePictureImage)
            
            self.nameLabel.text = beneficiaryItem.beneficiaryName.uppercased()
            
            self.detailsLabel.text = beneficiaryItem.details
            
            if beneficiaryItem.isFavourite == true {
                favouriteImageView.image = UIImage(systemName: favouriteIconImage)
            }
            
            if beneficiaryItem.isFavourite == false {
                favouriteImageView.image = UIImage(systemName: unfavouriteIconImage)
            }
            
            setUpAccessibility()
        }
    }
    
    //MARK: - cell lazy stored properties.
    lazy private var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = cellStackViewAxis
        view.spacing = cellStackViewSpacing
        return view
    }()
    
    lazy private var profileImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = profileImageViewContentMode
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        //        img.layer.cornerRadius = 35
        //        img.clipsToBounds = true
        img.tintColor = appRedColor
        return img
    }()
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = nameLabelFontSize
        label.textColor = appBlueColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var detailsLabel: UILabel = {
        let label = UILabel()
        label.font = detailsLabelFontSize
        label.textColor = detailsLabelTextColor
        label.numberOfLines = detailsLabelNumberOfLines
        label.lineBreakMode = detailsLabelLineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var favouriteImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = favouriteImageViewContentMode // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        //        img.layer.cornerRadius = 35
        //        img.clipsToBounds = true
        img.tintColor = favouriteImageViewTintColor
        
        return img
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //MARK: - favouriteImageView gesture recognizer logic.
        favouriteImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFavouriteImageTap))
        favouriteImageView.addGestureRecognizer(tapGestureRecognizer)
        
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: - Layout method definition
extension BeneficiaryTableViewCell {
    
    private func layout() {
        
        contentView.addSubview(profileImageView)
        stackView.addSubview(nameLabel)
        stackView.addSubview(detailsLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(favouriteImageView)
        
        profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: profileImageViewLeadingConstraint).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: profileImageViewWidthConstraint).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: profileImageViewHeightConstraint).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: cellStackViewLeadingConstraint).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: cellStackViewTrailingConstraint).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: cellStackViewHeightConstraint).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        detailsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: detailsLabelTopConstraint).isActive = true
        detailsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        detailsLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: detailsLabelTrailingConstraint).isActive = true
        
        favouriteImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        favouriteImageView.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: favouriteImageViewLeadingConstraint).isActive = true
        favouriteImageView.widthAnchor.constraint(equalToConstant: favouriteImageViewWidthConstraint).isActive = true
        favouriteImageView.heightAnchor.constraint(equalToConstant: favouriteImageViewHeightConstraint).isActive = true
    }
}

//MARK: - Handle favourite image
extension BeneficiaryTableViewCell {
    
    @objc private func handleFavouriteImageTap(sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
            if imageView.image == UIImage(systemName: unfavouriteIconImage) {
                imageView.image = UIImage(systemName: favouriteIconImage)
                beneficiary?.isFavourite = true
            } else {
                imageView.image = UIImage(systemName: unfavouriteIconImage)
                beneficiary?.isFavourite = false
            }
            
        }
        print(self.beneficiary ?? blankString)
    }
}

//MARK: - Accessibility setup.
extension BeneficiaryTableViewCell {
    
    private func setUpAccessibility() {
       
        nameLabel.isAccessibilityElement = true
        let nameLabelAccessibilityLabel = "\(nameLabelAccessibilityLabel),\(nameLabel.text ?? blankString)"
        
        detailsLabel.isAccessibilityElement = true
        let detailsLabelAccessibilityLabel = "\(detailsLabelAccessibilityLabel),\(detailsLabel.text ?? blankString)"
        
        profileImageView.isAccessibilityElement = true
        let profileImageViewAccessibilityLabel = profileImageViewAccessibilityLabel
        
        contentView.isAccessibilityElement = true
        contentView.accessibilityLabel = profileImageViewAccessibilityLabel + "," + nameLabelAccessibilityLabel + "," + detailsLabelAccessibilityLabel
        
        favouriteImageView.isAccessibilityElement = true
        if beneficiary?.isFavourite == true {
            favouriteImageView.accessibilityLabel = favouriteImageViewFavouriteAccessibilityLabel
        }
        else {
            favouriteImageView.accessibilityLabel = favouriteImageViewUnfavouriteAccessibilityLabel
        }
        favouriteImageView.accessibilityTraits = favouriteImageViewAccessibilityTraits
        
        //MARK: - array of accessibilityElements for sequence.
        accessibilityElements = [contentView, favouriteImageView]
    }
}


