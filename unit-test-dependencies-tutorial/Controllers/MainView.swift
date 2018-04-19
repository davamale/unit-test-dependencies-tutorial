//
//  MainView.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/1/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        searchButton.addTarget(self, action: #selector(updateCurrentAddress), for: .touchUpInside)
        
        updateCurrentAddress()
        
    }
    
    @objc func updateCurrentAddress() {
        LocationService.shared.currentAddress { [unowned self] (placemark) in
            guard let city = placemark?.locality, let postalCode = placemark?.postalCode else {
                self.addressLabel.text = "No Address"
                return
            }
            self.addressLabel.text = "\(city), \(postalCode)"
            self.fetchJobsAround(postalCode: postalCode)
        }
    }
    
    @objc func fetchJobsAround(postalCode: String) {
        
    }
}
