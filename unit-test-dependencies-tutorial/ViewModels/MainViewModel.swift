//
//  MainViewModel.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 4/19/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation

struct MainViewModel {
    
    let locationService: LocationServiceType
    let apiClient: ApiClientType
    
    func updateCurrentAddress() {
        LocationService.shared.currentAddress { (placemark) in
            guard let city = placemark?.locality, let postalCode = placemark?.postalCode else {
                
                return
            }
            let location = "\(city), \(postalCode)"
            self.fetchJobsAround(postalCode: postalCode)
        }
    }
    
    func fetchJobsAround(postalCode: String) {
        guard let url = URL(string: Route.parameters([Parameter.jobType: "ios", Parameter.location: postalCode]).completeUrl) else { return }
        ApiClient.get(url: url) { response in
            guard let response = response else { return }
            
        }
    }
}
