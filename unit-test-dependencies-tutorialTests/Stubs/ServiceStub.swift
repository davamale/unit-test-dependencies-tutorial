//
//  ServiceStub.swift
//  unit-test-dependencies-tutorialTests
//
//  Created by David Martinez-Lebron on 4/19/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class ServiceStub: LocationServiceType, ApiClientType {
    func currentAddress(completion: @escaping (MKPlacemark?) -> ()) {
        
    }
    
    func addressFor(postalCode: String, completion: @escaping (MKPlacemark?) -> ()) {
        
    }
    
    func get(url: URL, completion: @escaping ([NSDictionary]?) -> ()) {
        
    }
    
    
}
