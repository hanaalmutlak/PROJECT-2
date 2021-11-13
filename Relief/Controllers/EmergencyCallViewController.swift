//
//  PatientInformationViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 09/11/2021.
//

import UIKit

class EmergencyCallViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func callAmbulance(_ sender: Any) {
        callNumber(phoneNumber: "997")
    }
    
    @IBAction func callFirstAid(_ sender: Any) {
        callNumber(phoneNumber: "112")
    }
    
    @IBAction func callHealthEducation(_ sender: Any) {
        callNumber(phoneNumber: "920000583")
    }
    
    // show dialog for calling phone number -> only works on physical device!
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
