//
//  SeeMoreBankViewController.swift
//  DemoBank
//
//  Created by Asadullah Behlim on 24/02/23.
//

import Foundation
import UIKit

class SeeMoreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        // UICollectionViewFlowLayout is a concrete class of UICollectionViewLayout that has all its four members implemented, in the way that the cells will be arranged in a grid manner.
        
        // By using UICollectionViewFlowLayout, you can customize the layout of a collection view by specifying things like the size and position of items, the spacing between items and sections, and the direction of the scrolling.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    let cellId = "CollectionViewCell"
    
    var index: Int
    
    let viewModel = HomePageViewModel()
    
    //MARK: - Navigation bar and Tab bar lazy stored properties.
    lazy private var navBar: UINavigationBar = {
        let view = self.setNavigationBarForAddManageBeneficiary(title: "See more")
        return view
    }()
    
    init(index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpStatusAndNavigationBar()
        viewModel.parseJson()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderTitleViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderTitleViewCell")
        
        view.addSubview(navBar)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: navBar.bottomAnchor, multiplier: 0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.allData[index].data.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        
        cell.customImageView.setImage(UIImage(systemName: viewModel.allData[index].data[indexPath.row].iconName), for: .normal)
        cell.customImageView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cell.customImageView.tag = indexPath.row
        cell.customLabel.text = viewModel.allData[index].data[indexPath.row].label
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 'viewForSupplementaryElementOfKind' - This method is called by a collection view when it needs to display a supplementary view, such as a header or footer, and asks the delegate to provide a corresponding view.
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderTitleViewCell", for: indexPath) as! HeaderTitleViewCell
            header.titleLabel.text = viewModel.allData[index].title
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let viewController = self.getViewController() else {
            return
        }
        let buttonViewController = ButtonViewController()
        buttonViewController.buttonLabel.text = viewModel.allData[index].data[sender.tag].label
        if index == 2 && sender.tag == 6 {
            viewController.present(AddManageBeneficiaryViewController(), animated: true, completion: nil)
        }
        else {
            viewController.present(buttonViewController, animated: true, completion: nil)
        }
        
        viewController.modalPresentationStyle = .overFullScreen
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
}


//MARK: - Status bar & navigation bar setup.
extension SeeMoreViewController {
    
    private func setUpStatusAndNavigationBar() {
        self.changeStatusBarColor()
        view.addSubview(navBar)
    }
}
