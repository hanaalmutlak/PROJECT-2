//
//  CommonDiseasesSelectionViewController.swift
//  Relief
//
//  Created by Hana Alshmmri on 08/11/2021.
//

import UIKit

// Customizable Single/Multi Selection Table View

class SelectionViewController: UIViewController {
    
    // data source for table
    var data: [String] = []
    
    // support multiple selection?
    var multiSelection: Bool = false
    
    // array to store selection
    var selection: [Bool] = []
    
    // completion function to return selected items
    var completion: ([String]) -> () = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        
        if multiSelection {
            navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed)), animated: false)
        }
        
        // define tableView and add it to viewController's view
        let tableView = UITableView(frame: .init(x: 0, y: 0, width: 0, height: 0))
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // table constraints to fill view
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsMultipleSelection = true
        
        // register cell for reusability
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func donePressed() {
        var returnedValues: [String] = []
        for i in 0..<data.count {
            if selection[i] {
                returnedValues.append(data[i])
            }
        }
        completion(returnedValues)
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func prepareData() {
        data.forEach { _ in selection.append(false) }
    }
}

extension SelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        selection[indexPath.row] = true
        if !multiSelection {
            donePressed()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        selection[indexPath.row] = false
    }
}
