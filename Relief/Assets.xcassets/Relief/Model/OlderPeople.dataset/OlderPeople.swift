//
//  OlderPeople.swift
//  Relief
//
//  Created by Hana Alshmmri on 20/10/2021.
//

import Foundation
struct OlderPeople : Person , Hashable {

    var Name: String
    
    var Phone: Int
    
    var Identity: Int
    
    var location: String?
    
    var City: Cities
    
    var age: Int
    
    var  bloodtype : String
    
    // func was used to print a sentence
    
   func login(){
        print("\(Name) has logged in , his age is \(age) from city \(City)")
    }
    
    //
    func callSOS(typeOfcall: TypeOfCalling,citys: Cities) throws -> String {
    
        print("Calling Now in city \(citys.rawValue)...")
        
        switch typeOfcall {
        case .by2g:

            print("Your Info is :\(Name),and also \(Phone) , also added \(Identity) , and put \(String(describing: location)) , and we also put \(age) , we add \(bloodtype)")
            
            print("Please White...")
            
            print("calling 997...")
            
            print("caling your relative...")
            
            print("The call is by 2g")
            
            return "=calling 997..."
        case .by3g:
            return "The call is by 2g "
        case .noService:
            throw ErrorCalling.badCall
        }
        
       // return "caling your relative..."
        
    }
    
    
}
