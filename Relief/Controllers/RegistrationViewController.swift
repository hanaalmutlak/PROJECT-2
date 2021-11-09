//
//  RgViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 08/11/2021.
//

import UIKit

class RegistrationViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {

    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var bloodTypePicker: UISegmentedControl!
    @IBOutlet weak var registerButton: UIButton!
    
    let pathologicalCase = ["Diabetes","pressure","theHeat","clots","KidneyDialysis","Disability","ShortnessOfBreath","asthma","Suffocation"," Spasm","Fever"]
    
    let cities = ["Abha","Riyadh","Makkah","Tabuk","Jeddah","Khobar"]
    
    var selectedCity: Int = 0
    var selectedCommonDisease: Int = 0
    
    @IBOutlet weak var citiesPickerView: UIPickerView!
    
    @IBOutlet weak var diseasesPickerView: UIPickerView!
    @IBOutlet weak var cityButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesPickerView.dataSource = self
        diseasesPickerView.dataSource = self
        
        citiesPickerView.delegate = self
        diseasesPickerView.delegate = self
        
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        if validiateForm() {
            print("username", usernameTextField.text!)
            print("id", idTextField.text!)
            print("city", cities[selectedCity])
            print("disease", pathologicalCase[selectedCommonDisease])
            print("bloodType", bloodTypePicker.selectedSegmentIndex)
            performSegue(withIdentifier: "mainScreen", sender: nil)
        }
    }
    
    func validiateForm() -> Bool {
        if usernameTextField.text!.isEmpty {
            return false
        }
        if idTextField.text!.isEmpty {
            return false
        }
        if mobileNumberTextField.text!.isEmpty {
            return false
        }
        return true
    }
    
    @IBAction func openCommonDiseasesSelection() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let commonDiseasesSelectionViewController = storyboard.instantiateViewController(withIdentifier: "CommonDiseasesSelectionViewController") as! CommonDiseasesSelectionViewController
        self.present(commonDiseasesSelectionViewController, animated: true, completion: nil)
        // Present it w/o any adjustments so it uses the default sheet presentation.
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == citiesPickerView {
            return cities.count
        } else {
            return pathologicalCase.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == citiesPickerView {
            return cities[row]
        } else {
            return pathologicalCase[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == citiesPickerView {
            selectedCity = row
        } else {
            selectedCommonDisease = row
        }
    }
    
}
