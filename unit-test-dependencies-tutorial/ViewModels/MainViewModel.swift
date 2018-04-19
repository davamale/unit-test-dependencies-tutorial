//
//  MainViewModel.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 4/19/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation

typealias AddressCompletion = (String) -> ()

struct MainViewModel {
    
    private let locationServiceType: LocationServiceType
    private let apiClientType: ApiClientType
    private let addressCompletion: AddressCompletion
    
    init(locationServiceType: LocationServiceType, apiClientType: ApiClientType, addressCompletion: @escaping AddressCompletion) {
        self.locationServiceType = locationServiceType
        self.apiClientType = apiClientType
        self.addressCompletion = addressCompletion
    }
    
    func updateCurrentAddress() {
        locationServiceType.currentAddress { (placemark) in
            guard let city = placemark?.locality, let postalCode = placemark?.postalCode else {
                self.addressCompletion("No Address")
                return
            }
            let location = "\(city), \(postalCode)"
            self.addressCompletion(location)
        }
    }
    
    func updateAddressFor(postalCode: String) {
        locationServiceType.addressFor(postalCode: postalCode) { (placemark) in
            guard let city = placemark?.locality, let postalCode = placemark?.postalCode else {
                self.addressCompletion("No Address")
                return
            }
            let location = "\(city), \(postalCode)"
            self.addressCompletion(location)
        }
    }
    
    func fetchJobsAround(postalCode: String, completion: @escaping ([NSDictionary]?) -> ()) {
        guard let url = URL(string: Route.parameters([Parameter.jobType: "ios", Parameter.location: postalCode]).completeUrl) else { return }
        apiClientType.get(url: url) { response in
            guard let response = response else { return completion (nil) }
            completion(response)
        }
    }
}
