//
//  ApiClient.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/1/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import UIKit

struct ApiClient {

    static func get(endPoint: String, completion: () -> ()) {
        
        guard let url = URL(string: endPoint) else { return }
        
        let session = URLSession()
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            
            print("Response data \(data)")
        }
        task.resume()
        
        
    }
}

//extension ApiClient: ApiClientType {}

