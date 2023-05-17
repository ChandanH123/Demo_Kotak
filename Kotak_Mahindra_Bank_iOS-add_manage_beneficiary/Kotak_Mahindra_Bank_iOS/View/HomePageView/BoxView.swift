//
//  TestViewController.swift
//  DemoBank
//
//  Created by Asadullah Behlim on 11/02/23.
//

import Foundation
import UIKit

class BoxView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        // UICollectionViewFlowLayout is a concrete class of UICollectionViewLayout that has all its four members implemented, in the way that the cells will be arranged in a grid manner.
        
        // By using UICollectionViewFlowLayout, you can customize the layout of a collection view by specifying things like the size and position of items, the spacing between items and sections, and the direction of the scrolling.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    let cellId = "BoxView"
    
    var index: Int
    
    let viewModel = HomePageViewModel()
    
    init(index: Int) {
        self.index = index
        super.init(frame: .zero)
        
        viewModel.parseJson()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderTitleViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderTitleViewCell")
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.allData[index].data.count
    }
    
    
    //    if allData[1].data.label.count > 8: This checks if the number of items in the data source for section 1 is greater than 8.
    //    if indexPath.row == 7: This checks if the current cell being configured is the cell at index 7. If it is, then it configures it to display a "See more" button.
    //    else if indexPath.row < 8: If the current cell is not at index 7, then it configures it to display the corresponding icon and label from the data source. However, this condition ensures that only the first 8 items will be displayed in the collection view.
    //
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        
        if viewModel.allData[index].data.count > 8 {
            
            if indexPath.row == 7 {
                cell.customImageView.setImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
                cell.customImageView.setTitle("See more", for: .highlighted)
                cell.customImageView.addTarget(self, action: #selector(goToSeeMore(_:)), for: .touchUpInside)
                cell.customImageView.tag = indexPath.row
                cell.customLabel.text = "See more\n"
            }
            else if indexPath.row < 8 {
                cell.customImageView.setImage(UIImage(systemName: viewModel.allData[index].data[indexPath.row].iconName), for: .normal)
                cell.customImageView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                cell.customImageView.tag = indexPath.row
                cell.customLabel.text = viewModel.allData[index].data[indexPath.row].label
            }
        }
        else {
            cell.customImageView.setImage(UIImage(systemName: viewModel.allData[index].data[indexPath.row].iconName), for: .normal)
            cell.customImageView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            cell.customImageView.tag = indexPath.row
            cell.customLabel.text = viewModel.allData[index].data[indexPath.row].label
        }
        
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
            viewController.navigationController?.pushViewController(AddManageBeneficiaryViewController(), animated: true)
        }
        else {
            viewController.navigationController?.pushViewController(buttonViewController, animated: true)
        }
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: blankString, style: .plain, target: nil, action: nil)
        viewController.navigationController?.navigationBar.tintColor = navigationControllerNavigationBarTintColor
//            viewController.present(buttonViewController, animated: true, completion: nil)
    }
    
    
    @objc func goToSeeMore(_ sender: UIButton) {
        guard let viewController = self.getViewController() else {
            return
        }
        let seeMoreBankViewController = SeeMoreViewController(index: index)
        
        viewController.navigationController?.pushViewController(seeMoreBankViewController, animated: true)
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: blankString, style: .plain, target: nil, action: nil)
        viewController.navigationController?.navigationBar.tintColor = navigationControllerNavigationBarTintColor
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
