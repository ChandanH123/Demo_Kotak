//
//  ButtonViewController.swift
//  DemoBank
//
//  Created by Asadullah Behlim on 22/02/23.
//

import Foundation
import UIKit

class ButtonViewController: UIViewController {
    
    //MARK: - Navigation bar and Tab bar lazy stored properties.
    lazy private var navBar: UINavigationBar = {
        let view = self.setNavigationBarForAddManageBeneficiary(title: buttonLabel.text?.replacingOccurrences(of: "\n", with: "") ?? "")
        return view
    }()

    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .max
        label.textAlignment = .center
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = appGrayColor
        
        setUpStatusAndNavigationBar()
        
        view.addSubview(buttonLabel)

        NSLayoutConstraint.activate([
            buttonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
   
}

//MARK: - Status bar & navigation bar setup.
extension ButtonViewController {
    
    private func setUpStatusAndNavigationBar() {
        self.changeStatusBarColor()
        view.addSubview(navBar)
    }
}

