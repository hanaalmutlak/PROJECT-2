//
//  ViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 09/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTable: UITableView!
    
    let citiesVisited = [["Abha","Riyadh","Makkah","Tabuk","Jeddah","Khobar"]]
    
    let oneSection = ["First"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTable.delegate = self
        firstTable.dataSource = self
        // Do any additional setup after loading the view.
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return oneSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesVisited[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return oneSection[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = citiesVisited[indexPath.section][indexPath.row]
        return cell
    }
  }
