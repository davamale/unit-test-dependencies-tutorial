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
    
    let stubService: LocationServiceType & ApiClientType = ServiceStub()

    func testUpdateCurrentAddress() {
        let viewModel = MainViewModel(locationServiceType: stubService, apiClientType: stubService, addressCompletion: { address in
            expect(address).to(equal(DummyData.fullAddress))
        })
        
        viewModel.updateCurrentAddress()
    }
    
    func testUpdateAddressForPostalCode() {
        let viewModel = MainViewModel(locationServiceType: stubService, apiClientType: stubService, addressCompletion: { address in
            expect(address).to(equal(DummyData.fullAddress))
        })
        
        viewModel.updateAddressFor(postalCode: DummyData.postalCode)
    }
    
}
