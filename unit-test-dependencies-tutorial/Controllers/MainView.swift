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
        
        viewLoaded()
        updateCurrentAddress()
    }
}

// MARK: - Actions
@objc extension MainView {
    
    func updateCurrentAddress() {
        LocationService.shared.currentAddress { (placemark) in
            guard let city = placemark?.locality, let postalCode = placemark?.postalCode else {
                self.addressLabel.text = "No Address"
                return
            }
            self.addressLabel.text = "\(city), \(postalCode)"
        }
    }
}

// MARK: - ViewCustomizable
extension MainView: ViewCustomizable {
    
    func prepareView() {
        // customize your view
        view.backgroundColor = UIColor.groupTableViewBackground
    }
    
    func addButtonActions() {
        searchButton.addTarget(self, action: #selector(updateCurrentAddress), for: .touchUpInside)
    }
}

