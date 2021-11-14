//
//  CitySelection.swift
//  Relief
//
//  Created by Hana Alshmmri on 09/11/2021.
//

import Foundation

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var firstTable: UITableView!
    
    let citiesVisited = [["Abha","Riyadh","Makkah"],["Tabuk","Jeddah","Khobar"]]
    let twoSection = ["First","Second"]
    let imageCitiesVisited = [[UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")],[UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTable.delegate = self
        firstTable.dataSource = self
        // Do any additional setup after loading the view.
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesVisited[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return twoSection[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = citiesVisited[indexPath.section][indexPath.row]
        cell.imageView?.image = imageCitiesVisited[indexPath.section][indexPath.row]
        return cell
    }
}

