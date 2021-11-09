//
//  RgViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 08/11/2021.
//

import UIKit

class RegistrationViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {

    
    
    
    let PathologicalCase = ["Diabetes","pressure","theHeat","clots","KidneyDialysis","Disability","ShortnessOfBreath","asthma","Suffocation"," Spasm","Fever"]
    
    let citiesVisited = ["Abha","Riyadh","Makkah","Tabuk","Jeddah","Khobar"]
    
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
        
        
        performSegue(withIdentifier: "mainScreen", sender: nil)
        
        
    }
    
    @IBAction func openCitySelection() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let citySelectionViewController = storyboard.instantiateViewController(withIdentifier: "CitySelectionViewController") as! CitySelectionViewController
        self.present(citySelectionViewController, animated: true, completion: nil)
        // Present it w/o any adjustments so it uses the default sheet presentation.
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
            return citiesVisited.count
        }
        
        else if pickerView == diseasesPickerView {
            return PathologicalCase.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == citiesPickerView {
            return citiesVisited[row]
        }
        
        else if pickerView == diseasesPickerView {
            return PathologicalCase[row]
        }
        
        return ""
    }
    
}
