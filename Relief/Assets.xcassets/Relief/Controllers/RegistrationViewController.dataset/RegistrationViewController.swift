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
    
    var selectedCity: String = ""
    var selectedCommonDisease: String = ""
    
    @IBOutlet weak var citiesPickerView: UIPickerView!
    
    @IBOutlet weak var diseasesPickerView: UIPickerView!
    @IBOutlet weak var cityButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadUser()
        
        citiesPickerView.dataSource = self
        diseasesPickerView.dataSource = self
        
        citiesPickerView.delegate = self
        diseasesPickerView.delegate = self
        
        citiesPickerView.tag = 1
        diseasesPickerView.tag = 2
    
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func loadUser() {
        let defaults = UserDefaults.standard
        if let userName = defaults.string(forKey: "username") {
            usernameTextField.text = userName
        }
        
        if let userId = defaults.string(forKey: "id") {
            idTextField.text = userId
        }
    
    }
    
    func saveUser() {
        let defaults = UserDefaults.standard
        defaults.set(usernameTextField.text!, forKey: "username")
        defaults.set(idTextField.text!, forKey: "id")
    }
    
    @IBAction func login(_ sender: Any) {
        if validiateForm() {
            saveUser()
            print("username", usernameTextField.text!)
            print("id", idTextField.text!)
            print("city", selectedCity)
            print("disease", selectedCommonDisease)
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
        switch pickerView.tag {
        case 1:
            return cities.count

        case 2 :
            
            return pathologicalCase.count
            
        default:
            
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            return cities[row]

        case 2 :
            
            return pathologicalCase[row]
            
        default:
            
            return "Date not found"
        }
    }
        

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == citiesPickerView {
            selectedCity = cities[row]
        } else {
            selectedCommonDisease = pathologicalCase[row]
        }
    }
    
}
