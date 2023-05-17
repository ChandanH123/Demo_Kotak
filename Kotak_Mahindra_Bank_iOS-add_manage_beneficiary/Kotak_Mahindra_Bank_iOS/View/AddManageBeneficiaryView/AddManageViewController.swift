//
//  HomeViewController.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 14/02/23.
//

import Foundation
import UIKit

class AddManageBeneficiaryViewController: UIViewController {
    
    //MARK: - Navigation bar and Tab bar lazy stored properties.
    lazy private var navBar: UINavigationBar = {
        let view = self.setNavigationBarForAddManageBeneficiary(title: navBarTitle)
        return view
    }()
    
    lazy private var tabView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = tabViewBackgroundColor
        return view
    }()
    
    lazy private var allButton: UIButton = {
        let button = UIButton()
        button.setTitle(allButtonTitle, for: .normal)
        button.setTitleColor(allButtonTitleColor, for: .normal)
        button.titleLabel?.font = allButtonFontSize
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleTableViewData), for: .touchUpInside)
        return button
    }()
    
    lazy private var favouritesButton: UIButton = {
        let button = UIButton()
        button.setTitle(favouritesButtonTitle, for: .normal)
        button.setTitleColor(favouritesButtonTitleColor, for: .normal)
        button.titleLabel?.font = favouritesButtonFontSize
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleTableViewData), for: .touchUpInside)
        return button
    }()
    
    lazy private var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = underlineViewBackgroundColor
        return view
    }()
    
    lazy private var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: addButtonImage), for: .normal)
        button.tintColor = appRedColor
        button.setTitle(addButtonTitle, for: .normal)
        button.setTitleColor(addButtonTitleColor, for: .normal)
        button.titleLabel?.font = addButtonFontSize
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addNewBeneficiary), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Search bar lazy stored property.
    lazy private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = searchBarPlaceholder
        //        searchBar.showsCancelButton = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.layer.cornerRadius = searchBarCornerRadius
        searchBar.clipsToBounds = searchBarClipsToBounds
        return searchBar
    }()
    
    
    //MARK: - Table view lazy stored properties.
    lazy public var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy private var beneficiaryNotFoundErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = beneficiaryNotFoundErrorLabelText
        label.textColor = beneficiaryNotFoundErrorLabelTextColor
        label.font = beneficiaryNotFoundErrorLabelFontSize
        label.isHidden = true
        return label
    }()
    
    
    //MARK: - ViewModel initialization.
    lazy private var viewModel = AddManageBeneficiaryViewModel()
    
    
    //MARK: - View controller life cycle methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = appGrayColor
                
        setUpStatusAndNavigationBar()
        setUpTopTabBar()
        setUpSearchBar()
        setUpTableView()
        setUpAccessibility()
        
        viewModel.getBeneficiaries(buttonType: .all)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveUnderline(to: allButton)
    }
}


//MARK: - Status bar & navigation bar setup.
extension AddManageBeneficiaryViewController {
    
    private func setUpStatusAndNavigationBar() {
        self.changeStatusBarColor()
        view.addSubview(navBar)
    }
}

//MARK: -  Tab bar and underLine view setup.
extension AddManageBeneficiaryViewController {
    
    private func setUpTopTabBar() {
        view.addSubview(tabView)
        view.addSubview(allButton)
        view.addSubview(favouritesButton)
        view.addSubview(underlineView)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            tabView.topAnchor.constraint(equalToSystemSpacingBelow: navBar.bottomAnchor, multiplier: tabViewTopConstraint),
            tabView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tabView.heightAnchor.constraint(equalToConstant: tabViewHeightConstraint),
            
            allButton.centerYAnchor.constraint(equalTo: tabView.centerYAnchor),
            allButton.leadingAnchor.constraint(equalTo: tabView.leadingAnchor, constant: allButtonLeadingConstraint),
            
            favouritesButton.centerYAnchor.constraint(equalTo: tabView.centerYAnchor),
            favouritesButton.leadingAnchor.constraint(equalToSystemSpacingAfter: allButton.trailingAnchor, multiplier: favouritesButtonLeadingConstraint),
            
            addButton.centerYAnchor.constraint(equalTo: tabView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: tabView.trailingAnchor, constant: addButtonTrailingConstraint),
        ])
    }
    
    @objc private func toggleTableViewData(_ sender: UIButton) {
        
        moveUnderline(to: sender)
        
        if sender.currentTitle == ButtonType.all.rawValue {
            viewModel.getBeneficiaries(buttonType: .all)
        }
        else {
            viewModel.getBeneficiaries(buttonType: .favourites)
        }
        
        if viewModel.checkEmptyArray() {
            beneficiaryNotFoundErrorLabel.text = "No beneficiaries found!"
            beneficiaryNotFoundErrorLabel.isHidden = false
        } else {
            beneficiaryNotFoundErrorLabel.isHidden = true
        }
        tableView.reloadData()
    }
    
    private func moveUnderline(to button: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.underlineView.frame = CGRect(
                x: button.frame.origin.x,
                y: button.frame.origin.y + button.frame.size.height,
                width: button.frame.size.width,
                height: 2
            )
        })
    }
    
    @objc func addNewBeneficiary(_ sender: UIButton) {
        debugPrint("Add New Beneficiary Tapped!")
    }
}

//MARK: - Search bar setup.
extension AddManageBeneficiaryViewController {
    
    private func setUpSearchBar() {
        
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: tabView.bottomAnchor, constant: searchBarTopConstraint),
            searchBar.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: searchBarLeadingConstraint),
            searchBar.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: searchBarTrailingConstraint),
        ])
    }
}

// MARK: - UITextFieldDelegate for search bar.
extension AddManageBeneficiaryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Handle search text changes
        // debugPrint(searchText)
        updateTableViewWithSearch(searchInput: searchText)
    }
    
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        // Handle search button click
    //    }
    
    //    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //        // Handle cancel button click
    //    }
}

//MARK: - Setup and update table view.
extension AddManageBeneficiaryViewController {
    
    private func setUpTableView() {
        
        tableView.layer.cornerRadius = tableViewCornerRadius
        tableView.tableHeaderView = customTableHeaderView()
        tableView.separatorInset = tableViewSeparatorInset
        tableView.showsVerticalScrollIndicator = false
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BeneficiaryTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        view.addSubview(beneficiaryNotFoundErrorLabel)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: tableViewTopConstraint),
            tableView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            beneficiaryNotFoundErrorLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            beneficiaryNotFoundErrorLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
        ])
    }
    
    private func updateTableViewWithSearch(searchInput: String) {
        
        if viewModel.checkTabbarCurrentButtonState() == .all {
            
            if searchInput.isEmpty {
                viewModel.getBeneficiaries(buttonType: .all)
            }
            else {
                viewModel.getSearchedBeneficiaries(buttonType: .all ,searchInput: searchInput)
            }
        }
        else if viewModel.checkTabbarCurrentButtonState() == .favourites {
            
            if searchInput.isEmpty {
                viewModel.getBeneficiaries(buttonType: .favourites)
            }
            else {
                viewModel.getSearchedBeneficiaries(buttonType: .favourites, searchInput: searchInput)
            }
        }
        
        if viewModel.checkEmptyArray() {
            beneficiaryNotFoundErrorLabel.text = beneficiaryNotFoundErrorLabelText
            beneficiaryNotFoundErrorLabel.isHidden = false
        } else {
            beneficiaryNotFoundErrorLabel.isHidden = true
        }
        
        tableView.reloadData()
    }
}

//MARK: - Table view data source and delegate methods.
extension AddManageBeneficiaryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Determine the number of sections based on unique first letters
        return viewModel.getSectionCount()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return the appropriate first letter for each section
        return viewModel.getSectionTitle(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in each section
        return viewModel.getRowCount(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeneficiaryTableViewCell
        cell.beneficiary = viewModel.getCell(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getRowHeight()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Create a custom view for the section header
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        // Create a label for the section title
        let titleLabel = UILabel()
        titleLabel.text = viewModel.getSectionTitle(section: section)
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .gray
        
        // Add padding to the label
        let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        titleLabel.frame = titleLabel.frame.inset(by: padding)
        
        // Add the label to the header view
        headerView.addSubview(titleLabel)
        
        // Set the constraints for the label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: padding.left),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -padding.right),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: padding.top),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -padding.bottom)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.getSectionHeaderHeight()
    }
    
    func customTableHeaderView() -> UIView? {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel(frame: CGRect(x: 15, y: 15, width: 200, height: 30))
        label.text = tableViewHeaderLabelText
        label.accessibilityTraits = .header
        label.font = tableViewHeaderLabelFontSize
        label.textColor = appBlueColor
        containerView.addSubview(label)
        return containerView
    }

}

//MARK: - Accessibility setup.
extension AddManageBeneficiaryViewController {
    
    private func setUpAccessibility() {
        
        tabView.isAccessibilityElement = true
        tabView.accessibilityLabel = tabViewAccessibilityLabel
        
        allButton.isAccessibilityElement = true
        allButton.accessibilityLabel = allButtonAccessibilityLabel
        
        favouritesButton.isAccessibilityElement = true
        favouritesButton.accessibilityLabel = favouritesButtonAccessibilityLabel
        
        addButton.isAccessibilityElement = true
        addButton.accessibilityLabel = addButtonAccessibilityLabel
        
        searchBar.isAccessibilityElement = true
        searchBar.accessibilityLabel = searchBarAccessibilityLabel
        searchBar.accessibilityTraits = .searchField
        
        //MARK: - array of accessibilityElements for sequence.
        accessibilityElements = [navBar, tabView, allButton, favouritesButton, addButton, searchBar, tableView]
    }
}
