//
//  MainViewController.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 14/02/23.
//

import Foundation

import UIKit

class MainViewController: UIViewController
{
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(mainButtonTitle, for: .normal)
        button.backgroundColor = appRedColor
        button.layer.cornerRadius = mainButtonCornerRadius
        button.tintColor = mainButtonTintColor
        button.addTarget(self, action: #selector(goToHomeVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension MainViewController {
    func style() {
        
        view.backgroundColor = appGrayColor
    }
    func layout() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: mainButtonWidthConstraint),
            button.heightAnchor.constraint(equalToConstant: mainButtonHeightConstraint),
        ])
    }
}

extension MainViewController {
    
    @objc func goToHomeVC(_ sender: UIButton) {
        navigationController?.pushViewController(HomePageViewController(), animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: blankString, style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = navigationControllerNavigationBarTintColor
    }
}
