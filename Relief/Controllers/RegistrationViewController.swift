//
//  RgViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 08/11/2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var cityButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
