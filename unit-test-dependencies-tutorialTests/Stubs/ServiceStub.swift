//
//  ServiceStub.swift
//  unit-test-dependencies-tutorialTests
//
//  Created by David Martinez-Lebron on 4/17/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation
import MapKit
import Contacts

struct DummyData {
    static let streetAddres = "269–299 Geary St"
    static let city = "San Francisco"
    static let state = "CA"
    static let postalCode = "94102"
    static let country = "Estados Unidos"
    
    static var fullAddress: String {
        return "\(streetAddres) \(city) \(state) \(postalCode) \(country)"
    }
}

class ServiceStub: LocationServiceType {
    
    var addressDictionary: [String: Any] {
        let addresDict =
            [CNPostalAddressStreetKey : DummyData.streetAddres,
             CNPostalAddressCityKey : DummyData.city,
             CNPostalAddressStateKey : DummyData.state,
             CNPostalAddressPostalCodeKey : DummyData.postalCode,
             CNPostalAddressCountryKey : DummyData.country]
        return addresDict
    }
    
    func currentAddress(completion: @escaping (MKPlacemark?) -> ()) {
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(), addressDictionary: addressDictionary)
        completion(placemark)
    }
    
    
}
