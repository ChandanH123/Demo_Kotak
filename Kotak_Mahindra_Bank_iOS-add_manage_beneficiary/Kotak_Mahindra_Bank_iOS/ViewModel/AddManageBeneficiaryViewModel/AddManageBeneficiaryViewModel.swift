//
//  ViewModel.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 01/03/23.
//

import Foundation
import UIKit

class AddManageBeneficiaryViewModel {
    
    //MARK: - Models initialization.
    var beneficiaries = [AddManageBeneficiaryJsonModel]()
    
    var filteredItems = [AddManageBeneficiaryUIModel]()
    
    init() {
        let data = Bundle.main.url(forResource: "AddManageBeneficiaryData", withExtension: "json")
        getData(data: data)
    }
    
    
    //MARK: - Used to check the user is situated on which button currently.
    var tabBarCurrentButtonState: ButtonType = tabBarCurrentButtonDefaultState
    
    
    func getData(data: URL?) {
        if let url = data {
            do {
                let jsonData = try Data(contentsOf: url)
                
                let service = AddManageBeneficiaryService()
                
                service.fetchData(jsonData: jsonData) { responseModel, error in
                    if let data = responseModel {
                        self.beneficiaries = data
                    }
                }
            } catch {
                debugPrint("Error loading data from file:", error.localizedDescription)
                // Handle the error here, e.g. show an error message to the user
            }
        }
    }
    
    
    func getSectionCount() -> Int {
        let firstLetters =  Array(Set(filteredItems.map { String($0.beneficiaryName.prefix(1)) })).sorted()
        //        debugPrint(firstLetters)
        return firstLetters.count
    }
    
    func getSectionTitle(section: Int) -> String? {
        let firstLetters = Array(Set(filteredItems.map { String($0.beneficiaryName.prefix(1)) })).sorted()
        //        debugPrint(firstLetters)
        return firstLetters[section]
    }
    
    func getSectionHeaderHeight() -> CGFloat {
        return 25
    }
    
    func getRowCount(section: Int) -> Int {
        let firstLetters = Array(Set(filteredItems.map { String($0.beneficiaryName.prefix(1)) })).sorted()
        guard section < firstLetters.count else {
            // Handle the case where section is out of range
            return 0
        }
        let firstLetter = firstLetters[section]
        debugPrint(filteredItems.filter { String($0.beneficiaryName.prefix(1)) == firstLetter }.count)
        return filteredItems.filter { String($0.beneficiaryName.prefix(1)) == firstLetter }.count
    }
    
    func getRowHeight() -> CGFloat {
        return 80
    }
    
    func getCell(indexPath: IndexPath) -> AddManageBeneficiaryUIModel {
        let firstLetter = Array(Set(filteredItems.map { String($0.beneficiaryName.prefix(1)) })).sorted()[indexPath.section]
        //        debugPrint(firstLetter)
        let items = filteredItems.filter { String($0.beneficiaryName.prefix(1)) == firstLetter }.sorted()
        return items[indexPath.row]
    }
    
    func getBeneficiaries(buttonType: ButtonType) {
        if buttonType == .all {
            debugPrint("all")
            self.filteredItems = beneficiaries.map { beneficiary in
                return AddManageBeneficiaryUIModel(beneficiary: beneficiary)
            }
            self.tabBarCurrentButtonState = .all
        }
        else if buttonType == .favourites {
            debugPrint("fav")
            self.filteredItems = beneficiaries.map { beneficiary in
                return AddManageBeneficiaryUIModel(beneficiary: beneficiary)
            }.filter{$0.isFavourite}
            self.tabBarCurrentButtonState = .favourites
        }
    }
    
    func getSearchedBeneficiaries(buttonType: ButtonType, searchInput: String) {
        debugPrint(searchInput)
        if buttonType == .all {
            self.filteredItems = beneficiaries.map { beneficiary in
                return AddManageBeneficiaryUIModel(beneficiary: beneficiary)
            }.filter {
                return $0.beneficiaryName
                    .trimmingCharacters(in: .whitespaces)
                    .contains(
                        searchInput
                            .uppercased()
                            .trimmingCharacters(in: .whitespaces)
                    )
            }
        }
        
        else if buttonType == .favourites {
            self.filteredItems = beneficiaries.map { beneficiary in
                return AddManageBeneficiaryUIModel(beneficiary: beneficiary)
            }.filter {
                return $0.beneficiaryName
                    .trimmingCharacters(in: .whitespaces)
                    .contains(
                        searchInput
                            .uppercased()
                            .trimmingCharacters(in: .whitespaces)
                    )
            }.filter {
                $0.isFavourite == true
            }
        }
    }
    
    func checkEmptyArray() -> Bool {
        return self.filteredItems.isEmpty ? true : false
    }
    
    func checkTabbarCurrentButtonState() -> ButtonType {
        return self.tabBarCurrentButtonState == .all ? .all : .favourites
    }
}
