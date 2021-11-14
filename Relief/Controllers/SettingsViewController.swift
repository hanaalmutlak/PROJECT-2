//
//  SettingsViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 09/11/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signOut(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "user")
        self.performSegue(withIdentifier: "registerScreen", sender: nil)
        // - remove user from userDefaults
        // - seague to register view controller
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
}
