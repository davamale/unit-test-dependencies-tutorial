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
        
        //TODO: Make request to URLSession
        
        
    }
}

//extension ApiClient: ApiClientType {}

