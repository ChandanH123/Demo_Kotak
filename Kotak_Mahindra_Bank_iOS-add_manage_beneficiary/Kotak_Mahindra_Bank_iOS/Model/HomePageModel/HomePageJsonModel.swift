//
//  QuickAccessDataModel.swift
//  DemoBank
//
//  Created by Asadullah Behlim on 21/02/23.
//

//import Foundation
import UIKit

// MARK: - WelcomeElement
struct HomePageJsonModel: Codable {
    let id: Int
    let title: String
    let data: [IconModel]
}

// MARK: - Datum
struct IconModel: Codable {
    let label, iconName: String
}
