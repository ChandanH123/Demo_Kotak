//
//  HeroHeaderView.swift
//  DemoBank
//
//  Created by Asadullah Behlim on 07/02/23.
//
//
import UIKit
import Foundation

class HeaderView: UIView{
    
    private lazy var viewBalance: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View Balance", for: .normal)
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.backgroundColor = .systemRed
        button.layer.borderWidth = 1
        button.tintColor = .white
     //  button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return button
    }()
   
    @objc func buttonTapped() {
        guard let viewController = self.getViewController() else {
            return
        }
        let textViewController = TextViewController()
        textViewController.textToShow = "View Balance Button Tapped"
        viewController.present(textViewController, animated: true, completion: nil)
    }

    private func getViewController() -> UIViewController? {
          var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    
    lazy var savingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    // "Lazy" is a term used in UIKit to describe a technique for loading resources only when they are needed. This helps to improve the performance of an iOS app by avoiding the load of unnecessary resources.
    
    lazy var savingLabel: UILabel = {
        let label = UILabel()
        label.text = "Savings"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "₹35000"
        label.textColor = .white
        return label
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "KotakCard")
        return imageView
    }()
    
//    private func addGradient() {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor.clear.cgColor,
//            UIColor.systemBackground.cgColor
//        ]
//        gradientLayer.frame = bounds
//        layer.addSublayer(gradientLayer)
//    }
//
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
  //     addGradient()
        savingStackView.addArrangedSubview(savingLabel)
        savingStackView.addArrangedSubview(salaryLabel)
        addSubview(viewBalance)
        addSubview(savingStackView)
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        let savingConstraints = [
            savingStackView.centerYAnchor.constraint(equalTo: heroImageView.centerYAnchor),
            savingStackView.leadingAnchor.constraint(equalTo: heroImageView.leadingAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(savingConstraints)
        
        let viewBalanceConstraints = [
            viewBalance.centerYAnchor.constraint(equalTo: heroImageView.centerYAnchor),
            viewBalance.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            viewBalance.widthAnchor.constraint(equalToConstant: 120)
            
        ]
        NSLayoutConstraint.activate(viewBalanceConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // To adjust the frames of the view's subviews to ensure that they are positioned correctly within the view.
        
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
