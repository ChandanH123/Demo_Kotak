//
//  UIViewController+Utils.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 14/02/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func changeStatusBarColor() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height {
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = appRedColor
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = appRedColor
        }
    }
    
    
    func setNavigationBarForAddManageBeneficiary(title: String) -> UINavigationBar {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height {
            let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: statusBarHeight, width: view.frame.size.width, height: 50))
            // add your navigation bar customization code here
            
            let navigationItem = UINavigationItem()
            navigationItem.title = title
            navigationItem.accessibilityLabel = "\(title),\(navigationItemAccessibilityLabel)"
            

            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
            navBarAppearance.backgroundColor = appRedColor
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
            
            navigationBar.items = [navigationItem]
            
            return navigationBar
        }
        // return a default navigation bar instance if the if condition is not satisfied
        return UINavigationBar()
    }

    func setNavigationBarForHomePage(title: String) -> UINavigationBar {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height {

            let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: statusBarHeight, width: view.frame.size.width, height: 50))

            // Create stack view to hold the buttons
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.spacing = 25
            stackView.alignment = .center


            // Create menu button
            let menuButton = UIButton()
            menuButton.setImage(UIImage(systemName: "text.alignleft"), for: .normal)
            menuButton.tintColor = .white
            menuButton.translatesAutoresizingMaskIntoConstraints = false
            menuButton.addTarget(nil, action: #selector(menuButtonTapped), for: .touchUpInside)
            menuButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
            menuButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            stackView.addArrangedSubview(menuButton)


            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = UIFont.boldSystemFont(ofSize: 14.5)
            titleLabel.textColor = .white
            stackView.addArrangedSubview(titleLabel)

            // Create profile button
            let profileButton = UIButton()
            profileButton.setImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
            profileButton.tintColor = .white
            profileButton.addTarget(nil, action: #selector(profileButtonTapped), for: .touchUpInside)
            profileButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
            profileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            stackView.addArrangedSubview(profileButton)

            // Create bell button
            let bellButton = UIButton()
            bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
            bellButton.tintColor = .white
            bellButton.addTarget(nil, action: #selector(bellButtonTapped), for: .touchUpInside)
            bellButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            bellButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(bellButton)


            // Add stack view to navigation item
            let navigationItem = UINavigationItem()
            let rightBarButton = UIBarButtonItem(customView: stackView)
            navigationItem.rightBarButtonItem = rightBarButton


            // Customize navigation bar appearance
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.backgroundColor = appRedColor
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance

            // Set navigation item to navigation bar
            navigationBar.items = [navigationItem]

            return navigationBar
        }
        return UINavigationBar()
    }


    @objc func menuButtonTapped() {
        let textViewController =  TextViewController()
        textViewController.textToShow = "Menu Button Tapped"
        self.present(textViewController, animated: true, completion: nil)
    }


    @objc func profileButtonTapped(_ sender: UIButton) {
    let textViewController = TextViewController()
        textViewController.textToShow = "Profile Button Tapped"
        self.present(textViewController, animated: true, completion: nil)
    }

    
    @objc func bellButtonTapped(_ sender: UIButton) {
        let textViewController = TextViewController()
        textViewController.textToShow = "Notifications Tapped"
        self.present(textViewController, animated: true, completion: nil)
    }
}
