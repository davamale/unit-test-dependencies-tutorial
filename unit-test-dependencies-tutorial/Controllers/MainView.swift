//
//  MainView.swift
//  unit-test-dependencies-tutorial
//
//  Created by David Martinez-Lebron on 1/1/18.
//  Copyright © 2018 David Martinez-Lebron. All rights reserved.
//

import UIKit

class MainView: UIViewController, UITextFieldDelegate, UITableViewDataSource {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchStackView: UIStackView!
    private var viewModel: MainViewModel!
    
    private var jobs = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel(locationServiceType: LocationService.shared, apiClientType: ApiClient.shared, addressCompletion: { address in
            self.addressLabel.text = address
        })
        
        tableView.backgroundColor = UIColor.white
        tableView.tableFooterView = UIView()
        topView.backgroundColor = UIColor(red: 45/255, green: 49/255, blue: 66/255, alpha: 1)
        addressLabel.textColor = .white
        searchButton.setTitleColor(UIColor(red: 239/255, green: 131/255, blue: 84/255, alpha: 1), for: .normal)
        searchButton.addTarget(self, action: #selector(updateLocationTapped), for: .touchUpInside)
        
        updateCurrentAddress()
    }
    
    @objc func updateCurrentAddress() {
        viewModel.updateCurrentAddress()
    }
    
    @objc func updateLocationTapped() {
        searchText.resignFirstResponder()
        guard let postalCode = searchText.text, !postalCode.isEmpty else { return }
        viewModel.updateAddressFor(postalCode: postalCode)
    }
    
    @objc func fetchJobsAround(postalCode: String) {
        viewModel.fetchJobsAround(postalCode: postalCode) { (jobs) in
            guard let jobs = jobs else { return }
            self.jobs = jobs
            self.tableView.reloadData()
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        guard range.length == 1 || range.location < 5 else { return false }
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = jobs[indexPath.row]["title"] as? String
        
        return cell
    }
}
