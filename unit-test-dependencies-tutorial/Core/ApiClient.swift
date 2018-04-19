//
//  ApiClient.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/1/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import UIKit

struct ApiClient {

    static func get(url: URL, completion: @escaping ([NSDictionary]?) -> ()) {
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let deserializedResponse = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [NSDictionary]
                DispatchQueue.main.async {
                    completion(deserializedResponse)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}

