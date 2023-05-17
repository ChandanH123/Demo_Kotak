//
//  MockUrlSession.swift
//  Kotak_Mahindra_Bank_iOSTests
//
//  Created by Chandan on 03/04/23.
//

import Foundation


// Mock URLSession to return a fixed response for testing purposes.
class MockURLSession: URLSession {
    let data: Data?
    let urlResponse: URLResponse?
    let error: Error?
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        task.completionHandler = {
            completionHandler(self.data, self.urlResponse, self.error)
        }
        return task
    }
}

// Mock URLSessionDataTask to immediately call its completion handler.
class MockURLSessionDataTask: URLSessionDataTask {
    var completionHandler: (() -> Void)?
    
    override func resume() {
        completionHandler?()
    }
}
