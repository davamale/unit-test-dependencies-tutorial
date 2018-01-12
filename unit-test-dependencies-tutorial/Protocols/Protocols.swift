//
//  Protocols.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/1/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import Foundation

// Every core class should conform to a protocol
protocol ApiClientType {
    static func get(endPoint: String, completion: () -> ())
}

protocol LocationManagerType {
    func address(for zipcode: String)
}
