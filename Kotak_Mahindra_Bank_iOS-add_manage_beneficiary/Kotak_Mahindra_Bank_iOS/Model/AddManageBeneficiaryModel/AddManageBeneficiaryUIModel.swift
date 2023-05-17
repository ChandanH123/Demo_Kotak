//
//  BeneficiaryUIModel.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 14/02/23.
//

import Foundation

class AddManageBeneficiaryUIModel: Equatable, Comparable {
    static func == (lhs: AddManageBeneficiaryUIModel, rhs: AddManageBeneficiaryUIModel) -> Bool {
        return lhs.beneficiaryName == rhs.beneficiaryName && lhs.details == rhs.details && lhs.isFavourite == rhs.isFavourite
    }
    
    static func < (lhs: AddManageBeneficiaryUIModel, rhs: AddManageBeneficiaryUIModel) -> Bool {
        return lhs.beneficiaryName < rhs.beneficiaryName
    }
    
    var beneficiary: AddManageBeneficiaryJsonModel
    
    var beneficiaryName: String {
        return "\(beneficiary.beneficiaryName.uppercased())"
    }
    
    var details: String {
        return "\(beneficiary.bankName.uppercased()) | \(beneficiary.accountType) | \(beneficiary.accountNumber)"
    }
    
    var isFavourite: Bool {
        get {
            return beneficiary.isFavourite
        }
        set(newValue) {
            self.beneficiary.isFavourite = newValue
        }
    }
    
    init(beneficiary: AddManageBeneficiaryJsonModel) {
        self.beneficiary = beneficiary
    }
}
