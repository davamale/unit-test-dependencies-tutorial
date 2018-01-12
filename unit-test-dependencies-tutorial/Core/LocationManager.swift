//
//  LocationManager.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/12/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation
import CoreLocation

struct LocationManager {
    // Singleton
    static let shared = LocationManager()
    
    let locationManager = CLLocationManager()
    
    private init() {}
    
    internal func address(for zipcode: String) {
        
    }
}











