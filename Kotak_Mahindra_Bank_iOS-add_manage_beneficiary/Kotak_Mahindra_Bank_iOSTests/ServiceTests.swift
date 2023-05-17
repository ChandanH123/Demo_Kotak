//
//  ServiceTests.swift
//  Kotak_Mahindra_Bank_iOSTests
//
//  Created by Chandan on 09/04/23.
//

import XCTest

@testable import Kotak_Mahindra_Bank_iOS

class ServiceTests: XCTestCase {
    
    var service: AddManageBeneficiaryService!
    var result: [AddManageBeneficiaryJsonModel]?
    var error: Error?
     
    override func setUp() {
        super.setUp()
        service = AddManageBeneficiaryService()
        result = [AddManageBeneficiaryJsonModel]()
        error = nil
    }
    
    func testFetchData_WhenPassingJsonString_ShouldReturnJsonModel() throws {
        // Arrange
        let json = """
                [
                    {
                        "id": 1,
                        "beneficiary_name": "Abhinav mummy",
                        "bank_name": "Punjab national bank",
                        "account_type": "savings",
                        "account_number": "xxxxxxx",
                        "favourite": true,
                    }
                ]
            """.data(using: .utf8)!
        
        
        
        // Act
        service.fetchData(jsonData: json) { (jsonModel, err) in
            self.result = jsonModel
            self.error = err
        }
        
        // Assert
        XCTAssertNil(error)
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?[0].id, 1)
        XCTAssertEqual(result?[0].beneficiaryName, "Abhinav mummy")
        XCTAssertEqual(result?[0].bankName, "Punjab national bank")
        XCTAssertEqual(result?[0].accountType, "savings")
        XCTAssertEqual(result?[0].accountNumber, "xxxxxxx")
        XCTAssertEqual(result?[0].isFavourite, true)
    }
    
    func testFetchData_WhenPassingIncorrectJsonString_ShouldReturnError() throws {
        // Arrange
        let json = """
                [
                    {
                        "beneficiary_name": "Abhinav mummy",
                        "bank_name": "Punjab national bank",
                        "account_type": "savings",
                        "account_number": "xxxxxxx",
                        "favourite": true,
                    }
                ]
            """.data(using: .utf8)!
        

        // Act
        service.fetchData(jsonData: json) { (jsonModel, err) in
            self.result = jsonModel
            self.error = err
        }
        
        // Assert
        XCTAssertNil(result)
        XCTAssertNotNil(error)
    }
    
    override func tearDown() {
        service = nil
        result = nil
        error = nil
        super.tearDown()
    }
}

