//
//  RgViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 08/11/2021.
//

import UIKit

class RegistrationViewController: UIViewController {


    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var bloodTypePicker: UISegmentedControl!
    @IBOutlet weak var selectCityButton: UIButton!
    @IBOutlet weak var selectCommonDiseasesButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var contact1NameTextField: UITextField!
    @IBOutlet weak var contact1MobileNumberTextField: UITextField!
    @IBOutlet weak var contact2NameTextField: UITextField!
    @IBOutlet weak var contact2MobileNumberTextField: UITextField!
    //
//    let pathologicalCase = ["Diabetes","pressure","theHeat","clots","KidneyDialysis","Disability","ShortnessOfBreath","asthma","Suffocation"," Spasm","Fever"]
//
//    let cities = ["Abha","Riyadh","Makkah","Tabuk","Jeddah","Khobar"]
    
    let bloodTypes = ["A+", "B+", "O-", "AB"]
    
    
    var user: User = User(name: "", nationalId: 0, mobileNumber: 0, age: 0, city: "", bloodType: "", location: "", commonDiseases: [], contacts: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        ageLabel.text = "Age: \(Int(ageSlider.value))"
        
        // if user already in userDefaults load data and skip registeration.
        loadUser()
    }
    @IBAction func ageSliderValueChanged(_ sender: Any) {
        ageLabel.text = "Age: \(Int(ageSlider.value))"
    }
    
    @IBAction func selectCity(_ sender: Any) {
        let selectionVC = SelectionViewController()
        selectionVC.multiSelection = false
        selectionVC.title = "Select City"
        selectionVC.data = ["Abha","Riyadh","Makkah","Tabuk","Jeddah","Khobar"]
        selectionVC.completion = { selection in
            self.user.city = selection[0]
            self.selectCityButton.setTitle(selection[0], for: .normal)
        }
        let navigationVC = UINavigationController(rootViewController: selectionVC)
        navigationVC.isModalInPresentation = true
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @IBAction func selectCommonDiseases(_ sender: Any) {
        let selectionVC = SelectionViewController()
        selectionVC.multiSelection = true
        selectionVC.title = "Select Common Diseases"
        selectionVC.data = ["Diabetes", "High Blood Pressure", "Cancer", "Chronic kidney disease", "Chronic liver disease", "Chronic lung diseases", "Heart conditions"]
        selectionVC.completion = { selection in
            if selection.count == 0 {
                self.selectCommonDiseasesButton.setTitle("None", for: .normal)
            } else {
                self.user.commonDiseases = selection
                self.selectCommonDiseasesButton.titleLabel?.numberOfLines = 1
                self.selectCommonDiseasesButton.titleLabel?.adjustsFontSizeToFitWidth = true
                self.selectCommonDiseasesButton.setTitle(selection.joined(separator: ", "), for: .normal)
            }
        }
        let navigationVC = UINavigationController(rootViewController: selectionVC)
        navigationVC.isModalInPresentation = true
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    func loadUser() {
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                user = loadedUser
                print(user)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.performSegue(withIdentifier: "mainScreen", sender: nil)
                }
            }
        }
    }
    
    
    func saveUser() {
        self.user.name = usernameTextField.text!
        self.user.nationalId = Int(idTextField.text!)!
        self.user.mobileNumber = Int(mobileNumberTextField.text!)!
        self.user.bloodType = bloodTypes[bloodTypePicker.selectedSegmentIndex]
        self.user.age = Int(ageSlider.value)
        var contacts: [Contact] = []
        contacts.append(Contact(name: contact1NameTextField.text!, mobileNumber: Int(contact1MobileNumberTextField.text!)!))
        if !contact2NameTextField.text!.isEmpty && !contact2MobileNumberTextField.text!.isEmpty {
            contacts.append(Contact(name: contact2NameTextField.text!, mobileNumber: Int(contact2MobileNumberTextField.text!)!))
        }
        self.user.contacts = contacts
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "user")
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if validiateForm() {
            saveUser()
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
        if user.city.isEmpty {
            return false
        }
        if contact1NameTextField.text!.isEmpty {
            return false
        }
        if contact1MobileNumberTextField.text!.isEmpty {
            return false
        }
        return true
    }
    

//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        switch pickerView.tag {
//        case 1:
//            return cities.count
//
//        case 2 :
//
//            return pathologicalCase.count
//
//        default:
//
//            return 1
//        }
//    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        switch pickerView.tag {
//        case 1:
//            return cities[row]
//
//        case 2 :
//
//            return pathologicalCase[row]
//
//        default:
//
//            return "Date not found"
//        }
//    }
        

//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView == citiesPickerView {
//            selectedCity = cities[row]
//        } else {
//            selectedCommonDisease = pathologicalCase[row]
//        }
//    }
    
}
