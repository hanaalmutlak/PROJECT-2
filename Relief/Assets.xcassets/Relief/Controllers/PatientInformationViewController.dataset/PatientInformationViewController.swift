//
//  PatientInformationViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 09/11/2021.
//

import Foundation
import UIKit

class PatientInformationViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        if defaults.value(forKey: "username") != nil {
            //usernameLabel.text = defaults.value(forKey: "username")! as? String
        }
        if defaults.value(forKey: "id") != nil {
            //idLabel.text = defaults.value(forKey: "id")! as? String
        }
    
    }
}
