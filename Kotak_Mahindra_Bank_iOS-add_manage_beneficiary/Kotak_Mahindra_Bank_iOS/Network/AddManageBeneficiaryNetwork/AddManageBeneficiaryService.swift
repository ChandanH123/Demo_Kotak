//
//  Service.swift
//  Kotak_Mahindra_Bank_iOS
//
//  Created by Chandan on 03/04/23.
//

import Foundation

class AddManageBeneficiaryService {
    
    func fetchData(jsonData: Data, completionHandler: @escaping ([AddManageBeneficiaryJsonModel]?, Error?) -> Void) {
        do {
            let jsonModel = try JSONDecoder().decode([AddManageBeneficiaryJsonModel].self, from: jsonData)
            completionHandler(jsonModel, nil)
        } catch {
            completionHandler(nil, error)
        }
    }
}

