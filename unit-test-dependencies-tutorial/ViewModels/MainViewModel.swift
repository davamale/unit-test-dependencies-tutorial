//
//  MainViewModel.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/12/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation

struct MainViewModel {
    
    private let locationServiceType: LocationServiceType
    
    init(locationServiceType: LocationServiceType) {
        self.locationServiceType = locationServiceType
    }
    
    func updateCurrentAddress(completion: @escaping (String) -> ()) {
        
        locationServiceType.currentAddress { (placemark) in
            guard let title = placemark?.title else {
                    return completion("No Address")
            }
            completion(title)
        }
    }
    
    func currentPostalCode(completion: @escaping (String) -> ()) {
        locationServiceType.currentAddress { (placemark) in
            guard let postalCode = placemark?.postalCode else {
                return completion("No Address")
            }
            completion(postalCode)
        }
    }
}
