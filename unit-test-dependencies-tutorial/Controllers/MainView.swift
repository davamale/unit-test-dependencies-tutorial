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
    private let viewModel = MainViewModel(locationServiceType: LocationService.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLoaded()
    }
}

// MARK: - Actions
@objc extension MainView {
    
    func updateCurrentAddress() {
        viewModel.updateCurrentAddress { [unowned self] (address) in
            self.addressLabel.text = address
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

