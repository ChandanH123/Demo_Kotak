//
//  Beneficiary.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 08/02/23.
//

import UIKit 

class AddManageBeneficiaryJsonModel: Codable {
    let id: Int
    let beneficiaryName: String
    let bankName: String
    let accountType: String
    let accountNumber: String
    var isFavourite: Bool
    
    init(id: Int, beneficiaryName: String, bankName: String, accountType: String, accountNumber: String, isFavourite: Bool) {
        self.id = id
        self.beneficiaryName = beneficiaryName
        self.bankName = bankName
        self.accountType = accountType
        self.accountNumber = accountNumber
        self.isFavourite = isFavourite
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case beneficiaryName = "beneficiary_name"
        case bankName = "bank_name"
        case accountType = "account_type"
        case accountNumber = "account_number"
        case isFavourite = "favourite"
    }
}





