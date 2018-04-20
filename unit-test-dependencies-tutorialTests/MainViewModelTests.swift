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
            expect(address).to(equal(DummyData.Location.fullAddress))
        })
        
        viewModel.updateCurrentAddress()
    }
    
    func testUpdateAddressForPostalCode() {
        
        let postalCode = "94102"
        
        let viewModel = MainViewModel(locationServiceType: stubService, apiClientType: stubService, addressCompletion: { address in
            expect(address).to(equal(DummyData.Location.fullAddress))
        })
        
        viewModel.updateAddressFor(postalCode: postalCode)
    }
    
    func testFetchJobsAroundPostalCode() {
        let viewModel = MainViewModel(locationServiceType: stubService, apiClientType: stubService, addressCompletion: { address in
            expect(address).to(equal(DummyData.Location.fullAddress))
        })
        
        viewModel.fetchJobsAround(postalCode: DummyData.Location.postalCode) { (response) in
            let responseTitle = response!.first!["title"] as! String
            expect(responseTitle).to(equal(DummyData.Api.response["title"]))
        }
    }
    
}
