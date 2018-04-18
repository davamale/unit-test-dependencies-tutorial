//
//  MainViewModelTests.swift
//  unit-test-dependencies-tutorialTests
//
//  Created by David Martinez-Lebron on 1/12/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import XCTest
import Nimble

class MainViewModelTests: XCTestCase {
    
    func testUpdateCurrentAddress() {
        let stubService: LocationServiceType = ServiceStub()
        let viewModel = MainViewModel(locationServiceType: stubService)
        
        viewModel.updateCurrentAddress { (address) in
            expect(address).to(equal(DummyData.fullAddress))
        }
    }
    
    func testCurrentPostalCode() {
        let stubService: LocationServiceType = ServiceStub()
        let viewModel = MainViewModel(locationServiceType: stubService)
        
        viewModel.currentPostalCode { (postalCode) in
            expect(postalCode).to(equal(DummyData.postalCode))
        }
    }
}
