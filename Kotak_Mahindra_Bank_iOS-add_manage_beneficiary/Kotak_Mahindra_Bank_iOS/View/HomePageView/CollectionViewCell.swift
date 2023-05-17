//
//  CustomCollectionViewCell.swift
//  DemoBank
//
//  Created by Asadullah Behlim on 11/02/23.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {

    let customImageView = UIButton(type: .system)
    let customLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        customImageView.contentMode = .scaleAspectFill
        customImageView.clipsToBounds = true
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.tintColor = appBlueColor
        customImageView.backgroundColor = .white
        customImageView.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        customImageView.layer.cornerRadius = 10
        contentView.addSubview(customImageView)
        
        customLabel.textAlignment = .center
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.numberOfLines = 2
        customLabel.lineBreakMode = .byWordWrapping
        customLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(customLabel)

        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customImageView.bottomAnchor.constraint(equalTo: customLabel.topAnchor, constant: -5),

            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
