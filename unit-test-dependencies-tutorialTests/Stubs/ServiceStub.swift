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
    struct Location {
        static let streetAddres = "269–299 Geary St"
        static let city = "San Francisco"
        static let subLocality = "Union Square"
        static let state = "CA"
        static let postalCode = "94102"
        static let country = "Estados Unidos"
        static let isoCountry = "US"
        
        static var fullAddress: String {
            return "\(city), \(postalCode)"
        }
    }
    
    struct Api {
        static let response = ["title": "iOS Developer Test"]
        
        static var responseArray: [[String: Any]] {
            return [response]
        }
    }

}



class ServiceStub: LocationServiceType, ApiClientType {
    
    var addressDictionary: [String: Any] {
        let addresDict =
            [CNPostalAddressStreetKey : DummyData.Location.streetAddres,
             CNPostalAddressCityKey : DummyData.Location.city,
             CNPostalAddressSubLocalityKey: DummyData.Location.subLocality,
             CNPostalAddressStateKey : DummyData.Location.state,
             CNPostalAddressPostalCodeKey : DummyData.Location.postalCode,
             CNPostalAddressCountryKey : DummyData.Location.country,
             CNPostalAddressISOCountryCodeKey : DummyData.Location.isoCountry]
        return addresDict
    }
    
    func currentAddress(completion: @escaping (MKPlacemark?) -> ()) {
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(), addressDictionary: addressDictionary)
        completion(placemark)
    }
    
    func addressFor(postalCode: String, completion: @escaping (MKPlacemark?) -> ()) {
        guard postalCode == DummyData.Location.postalCode else { return completion (nil) }
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(), addressDictionary: addressDictionary)
        completion(placemark)
    }
    
    func get(url: URL, completion: @escaping ([NSDictionary]?) -> ()) {
        
    }
}
