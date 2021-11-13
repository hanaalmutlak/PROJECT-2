//
//  PatientInformationViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 09/11/2021.
//

import Foundation
import UIKit

class PatientInformationViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var commonDiseasesLabel: UILabel!
    @IBOutlet weak var bloodTypeLabel: UILabel!
    @IBOutlet weak var contact1Label: UILabel!
    @IBOutlet weak var contact2Label: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUser()
    }
    
    // load saved user from userDefaults
    func loadUser() {
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                user = loadedUser
                nameLabel.text = user.name
                idLabel.text = "\(user.nationalId)"
                mobileNumberLabel.text = "\(user.mobileNumber)"
                ageLabel.text = "\(user.age)"
                cityLabel.text = user.city
                commonDiseasesLabel.text = user.commonDiseases.joined(separator: ", ")
                bloodTypeLabel.text = user.bloodType
                contact1Label.text = "\(user.contacts[0].name), \(user.contacts[0].mobileNumber)"
                if user.contacts.count > 1 {
                    contact1Label.text = "\(user.contacts[1].name), \(user.contacts[1].mobileNumber)"
                }
                
                //self.performSegue(withIdentifier: "mainScreen", sender: nil)
            }
        }
    }
}
