//
//  ApiClient.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/1/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import UIKit

enum Route {
    static let baseUrl = "https://jobs.github.com/positions.json"
    
    case parameters([Parameter: String])
    
    var completeUrl: String {
        
        if case let Route.parameters(parameters) = self {
            
            let encodedParams = parameters.reduce("") { result, value in
                guard let htmlEncoded = value.value.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) else { return "" }
                return result + "\(value.key.rawValue)=\(htmlEncoded)&"
            }
            return "\(Route.baseUrl)?\(encodedParams)"
        }
        
        return Route.baseUrl
    }
}

enum Parameter: String {
    case jobType = "description"
    case location
}

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

