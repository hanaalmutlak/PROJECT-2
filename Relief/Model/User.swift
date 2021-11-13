//
//  User.swift
//  Relief
//
//  Created by Hana Alshmmri on 20/10/2021.
//

import Foundation

struct User: Codable {
    
    var name: String
    var nationalId: Int
    var mobileNumber: Int
    var age: Int
    var city: String
    var bloodType: String
    var location: String
    var commonDiseases: [String]
    var contacts: [Contact]
}

struct Contact: Codable {
    var name: String
    var mobileNumber: Int
}
