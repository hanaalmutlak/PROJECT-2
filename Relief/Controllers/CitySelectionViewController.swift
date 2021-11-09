//
//  CitySelectionViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 08/11/2021.
//

import Foundation
import UIKit

class CitySelectionViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let closeButton = UIButton()
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
        closeButton.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
        //closeButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
}
