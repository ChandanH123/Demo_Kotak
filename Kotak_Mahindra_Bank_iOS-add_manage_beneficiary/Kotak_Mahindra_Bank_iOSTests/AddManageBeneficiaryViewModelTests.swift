//
//  Kotak_Mahindra_Bank_iOSTests.swift
//  Kotak_Mahindra_Bank_iOSTests
//
//  Created by Chandan on 03/03/23.
//

import XCTest

@testable import Kotak_Mahindra_Bank_iOS

class ViewModelTests: XCTestCase {
    
    var viewModel: AddManageBeneficiaryViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = AddManageBeneficiaryViewModel()
    }

    
    func testGetSectionCount() {
        // Arrange
        viewModel.filteredItems = [
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true)),
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Bhakti",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true))
        ]
        
        // Act
        // Test that the function returns the correct row count for a valid section
        let result = viewModel.getSectionCount()
        
        // Assert
        XCTAssertEqual(result, 2, "Expected result to be 2")
    }
    
    func testGetSectionTitle_WhenPassingSection_ShouldReturnSectionTitle() {
        // Arrange
        viewModel.filteredItems = [
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true)),
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Bhakti",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true))
        ]
        
        // Act
        // Test that the function returns the correct row count for a valid section
        let result = viewModel.getSectionTitle(section: 1)
        
        // Assert
        XCTAssertEqual(result, "B", "Expected result to be 'B'")
    }
    
    func testSectionHeaderHeight() {
        // Arrange
        let expectedSectionHeaderHeight: CGFloat = 25
        
        // Act
        // Test that the function returns the correct row count for a valid section
        let result = viewModel.getSectionHeaderHeight()
        
        // Assert
        XCTAssertEqual(result, expectedSectionHeaderHeight, "Expected result to be 25")
    }
    
    func testGetRowCount_WhenPassingValidSection_ShouldReturnCorrectRowCount() {
        // Arrange
        viewModel.filteredItems = [
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true)),
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Abhay",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true))
        ]
        
        // Act
        // Test that the function returns the correct row count for a valid section
        let result = viewModel.getRowCount(section: 0)
        
        // Assert
        XCTAssertEqual(result, 2, "Expected result to be 2")
    }
    
    func testGetRowCount_WhenPassingOutOfRangeSection_ShouldReturnZeroRowCount() {
        // Arrange
        viewModel.filteredItems = [
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true)),
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Abhay",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true))
        ]
        
        // Act
        // Test that the function returns 0 for an out-of-range section
        let result = viewModel.getRowCount(section: 1)
        
        // Assert
        XCTAssertEqual(result, 0, "Expected result to be 2")
    }
    
    func testRowHeight() {
        // Arrange
        let expectedRowHeight: CGFloat = 80
        
        // Act
        // Test that the function returns the correct row count for a valid section
        let result = viewModel.getRowHeight()
        
        // Assert
        XCTAssertEqual(result, expectedRowHeight, "Expected result to be 80")
    }
    
    func testGetCell_WhenPassingIndexPath_ShouldReturnCorrectItem() {
        // Arrange
        viewModel.filteredItems = [
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true)),
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Bhakti",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true))
        ]
        
        let expectedItem = viewModel.filteredItems[0]
        let indexPath = IndexPath(row: 0, section: 0)
        
        // Act
        let result = viewModel.getCell(indexPath: indexPath)
        
        // Assert
        XCTAssertEqual(result, expectedItem, "Returned result does not match expected item")
    }
    
    func testGetBeneficiaries_WhenPassingButtonTypeAll_ShouldReturnAllBeneficiaries() {
        // Arrange
        viewModel.beneficiaries = [
            AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true),
            AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Abhay",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: false)
        ]
        
        // Act
        // Test that the function returns the correct row count for a valid section
        viewModel.getBeneficiaries(buttonType: .all)
        
        // Assert
        XCTAssertEqual(viewModel.filteredItems.count, 2, "Expected result to be 2")
        XCTAssertEqual(viewModel.tabBarCurrentButtonState, .all, "Expected result to be .all")
    }
    
    func testGetBeneficiaries_WhenPassingButtonTypeFavourites_ShouldReturnFavouritesBeneficiaries() {
        // Arrange
        viewModel.beneficiaries = [
            AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true),
            AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Abhay",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: false)
        ]
        
        // Act
        // Test that the function returns the correct row count for a valid section
        viewModel.getBeneficiaries(buttonType: .favourites)
        
        // Assert
        XCTAssertEqual(viewModel.filteredItems.count, 1, "Expected result to be 1")
        XCTAssertEqual(viewModel.tabBarCurrentButtonState, .favourites, "Expected result to be .favourites")
    }
    
    func testGetSearchedBeneficiaries_WhenPassingButtonTypeAllAndCorrectSearchInput_ShouldReturnAllSearchedBeneficiaries() {
        // Arrange
        viewModel.beneficiaries = [
            AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true),
            AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Bhakti",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: false)
        ]
        
        // Act
        // Test that the function returns the correct row count for a valid section
        viewModel.getSearchedBeneficiaries(buttonType: .all, searchInput: "a")
        
        // Assert
        XCTAssertEqual(viewModel.filteredItems.count, 2, "Expected result to be 2")
        XCTAssertEqual(viewModel.filteredItems[0].beneficiaryName, "ABHINAV MUMMY", "Expected result to be 'ABHINAV MUMMY'")
        XCTAssertEqual(viewModel.filteredItems[1].beneficiaryName, "BHAKTI", "Expected result to be 'BHAKTI'")
    }
    
    func testGetSearchedBeneficiaries_WhenPassingButtonTypeFavouritesAndCorrectSearchInput_ShouldReturnFavouritesSearchedBeneficiaries() {
        // Arrange
        viewModel.beneficiaries = [
            AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true),
            AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Bhakti",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: false)
        ]
        
        // Act
        // Test that the function returns the correct row count for a valid section
        viewModel.getSearchedBeneficiaries(buttonType: .favourites, searchInput: "a")
        
        // Assert
        XCTAssertEqual(viewModel.filteredItems.count, 1, "Expected result to be 1")
        XCTAssertEqual(viewModel.filteredItems[0].beneficiaryName, "ABHINAV MUMMY", "Expected result to be 'ABHINAV MUMMY'")
    }
    
    func testCheckEmptyArray_WhenDefiningEmptyArray_ShoulReturnTrue() {
        // Arrange
        viewModel.filteredItems = []
        
        // Act
        let result = viewModel.checkEmptyArray()
        
        // Assert
        XCTAssertEqual(result, true, "Expected result to be 'true'")
    }
    
    func testCheckEmptyArray_WhenDefiningArrayOfObjects_ShoulReturnFalse() {
        // Arrange
        viewModel.filteredItems = [
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 1,
                beneficiaryName: "Abhinav mummy",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true)),
            AddManageBeneficiaryUIModel(beneficiary: AddManageBeneficiaryJsonModel(
                id: 2,
                beneficiaryName: "Bhakti",
                bankName: "Punjab national bank",
                accountType: "savings",
                accountNumber: "xxxxxxx",
                isFavourite: true))
        ]
        
        // Act
        let result = viewModel.checkEmptyArray()
        
        // Assert
        XCTAssertEqual(result, false, "Expected result to be 'false'")
    }
    
    func testCheckTabbarCurrentButtonState_WhenDefiningButtonTypeAll_ShouldReturnAll() {
        // Arrange
        viewModel.tabBarCurrentButtonState = .all
        
        // Act
        let result = viewModel.checkTabbarCurrentButtonState()
        
        // Assert
        XCTAssertEqual(result, .all, "Expected result to be '.all'")
    }
    
    func testCheckTabbarCurrentButtonState_WhenDefiningButtonTypeFavourites_ShouldReturnFavourites() {
        // Arrange
        viewModel.tabBarCurrentButtonState = .favourites
        
        // Act
        let result = viewModel.checkTabbarCurrentButtonState()
        
        // Assert
        XCTAssertEqual(result, .favourites, "Expected result to be '.favourites'")
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
}
