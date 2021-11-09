//
//  CitySelectionViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 09/11/2021.
//

import UIKit

class CitySelectionViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {
    
    let citiesVisited = ["Abha","Riyadh","Makkah","Tabuk","Jeddah","Khobar"]
    

    

    @IBOutlet weak var pickerViewCities: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewCities.delegate = self
        pickerViewCities.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesVisited.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesVisited[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
