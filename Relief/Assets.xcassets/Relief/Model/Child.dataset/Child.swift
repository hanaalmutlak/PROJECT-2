//
//  Child.swift
//  Relief
//
//  Created by Hana Alshmmri on 20/10/2021.
//

import Foundation

protocol Person {
    
    var Name : String { get set}
    
    var Phone : Int { get}
    
    var Identity : Int {get}
    
    var age : Int {get}
    
    var City : Cities { get }
    
    var location : String? {get}
    
    var  bloodtype : String {get}
    
}


struct Child : Person {
    
    
    var Name: String
    
    var Phone: Int
    
    var Identity: Int
    
    var age: Int
    
    var City: Cities
    
    var location: String?
    
    var fatherPhonenumber : String
    
    var  bloodtype : String

}
