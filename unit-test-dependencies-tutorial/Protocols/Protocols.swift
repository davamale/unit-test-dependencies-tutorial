//
//  Protocols.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/1/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation
import MapKit

protocol ViewCustomizable {
    func viewLoaded()
    func prepareView()
    func addButtonActions()
}

extension ViewCustomizable {
    func viewLoaded() {
        prepareView()
        addButtonActions()
    }
}

protocol LocationServiceType {
    func currentAddress(completion: @escaping (MKPlacemark?) -> ())
    func addressFor(postalCode: String, completion: @escaping (MKPlacemark?) -> ())
}

protocol ApiClientType {
    func get(url: URL, completion: @escaping ([NSDictionary]?) -> ())
}
