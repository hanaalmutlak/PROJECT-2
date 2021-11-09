//
//  String+.swift
//  Relief
//
//  Created by Hana Alshmmri on 20/10/2021.
//

import Foundation
extension String {
    var SOS: String {
        return "Calling SOS.."
    }
}

//
enum Cities : String {
    
    case Hail
    case Riyadh
    case Abha
    case Bisha
    case Buraydah
    case Dammam
    case Diriyah
    case Dawadmi
    case Aljawf
    case Jeddah
    case Jizan
    case Jubail
    case KhamisMushayt
    case Khobar
    case Mecca
    case Medina
    case Najran
    case Sakakah
    case Taif
    case Tabuk
    case Yanbu
    
}

//
enum PathologicalCase {
    
    case Diabetes
    case pressure
    case theHeat
    case clots
    case KidneyDialysis
    case Disability
    case ShortnessOfBreath
    case asthma
    case Suffocation
    case Spasm
    case Fever
}

enum services {
    case consultation
    case callAnAmbulance
    case HealthEducation
}
enum TypeOfCalling {
    
    case by2g
    case by3g
    case noService
    
    
}

enum ErrorCalling : Error {
    
    case badCall
    case errorData
    
}
