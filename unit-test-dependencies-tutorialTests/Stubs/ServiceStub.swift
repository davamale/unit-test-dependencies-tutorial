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

struct DummyData {
    static let streetAddres = "269–299 Geary St"
    static let city = "San Francisco"
    static let subLocality = "Union Square"
    static let state = "CA"
    static let postalCode = "94102"
    static let country = "Estados Unidos"
    static let isoCountry = "US"
}

class ServiceStub: LocationServiceType, ApiClientType {
    
    var addressDictionary: [String: Any] {
        let addresDict =
            [CNPostalAddressStreetKey : DummyData.streetAddres,
             CNPostalAddressCityKey : DummyData.city,
             CNPostalAddressSubLocalityKey: DummyData.subLocality,
             CNPostalAddressStateKey : DummyData.state,
             CNPostalAddressPostalCodeKey : DummyData.postalCode,
             CNPostalAddressCountryKey : DummyData.country,
             CNPostalAddressISOCountryCodeKey : DummyData.isoCountry]
        return addresDict
    }
    
    func currentAddress(completion: @escaping (MKPlacemark?) -> ()) {
        let placemarkd = MKPlacemark(coordinate: CLLocationCoordinate2D(), addressDictionary: addressDictionary)
        completion(placemark)
    }
    
    func currentAddress(completion: @escaping (MKPlacemark?) -> ()) {
        
    }
    
    func addressFor(postalCode: String, completion: @escaping (MKPlacemark?) -> ()) {
        
    }
    
    func get(url: URL, completion: @escaping ([NSDictionary]?) -> ()) {
        
    }
    
    
}
