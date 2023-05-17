//
//  ApiManager.swift
//  DemoBank
//
//  Created by Asadullah Behlim on 22/02/23.
//

import Foundation

class HomePageViewModel {
    
    var allData: [HomePageJsonModel] = []
    
    func parseJson()
    {
        // Parse the JSON file and store the data in the AccessDataArray
        guard let url = Bundle.main.url(forResource: "HomePageData", withExtension: "json") else {
            debugPrint("File not found!")
            return
        }
        do {
            let jsonData = try Data(contentsOf: url)
            allData = try JSONDecoder().decode([HomePageJsonModel].self, from: jsonData)
            debugPrint(allData)
        }
        catch
        {
            debugPrint(error.localizedDescription)
        }
    }
}
