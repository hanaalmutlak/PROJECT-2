//
//  HealthCondition.swift
//  Relief
//
//  Created by Hana Alshmmri on 20/10/2021.
//

import Foundation


class HealthCondition {
    var Name: String
    
    var Phone: Int
    
    var Identity: Int
    
    var age: Int
    
    var City: Cities
    
    var location: String?
    
    var bloodtype: String
    
    init(Name: String ,Phone: Int ,Identity: Int ,age: Int,location: String ,City: Cities ,bloodtype: String) {
        self.Name = Name
        self.Phone = Phone
        self.Identity = Identity
        self.age = age
        self.City = City
        self.location = location
        self.bloodtype = bloodtype
    }
}
