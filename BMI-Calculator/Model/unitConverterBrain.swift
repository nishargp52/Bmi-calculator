//
//  unitConverterBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by nisharg patel on 2020-03-17.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation


struct unitConverterBrain {
    
    let formatter = MeasurementFormatter()
    func convertMtoCm(height:String)->String{
            
        let heightNum = (height.split(separator: " "))
            let heightM = Double(heightNum[0])!
            let heightCm = Measurement(value: heightM, unit: UnitLength.meters).converted(to: .centimeters)
            formatter.unitOptions = .providedUnit
            let heightCmInString = formatter.string(from: heightCm)
            print(heightCmInString)
    //        return heightCmInString
            let heightCmNum = heightCmInString.split(separator: " ")
            print(heightCmNum)
            let heightCmNum1 = Double(heightCmNum[0])!
            let heightCmNoDecimal = String(format: "%.0f", heightCmNum1)
            return heightCmNoDecimal
        }
        
    func convertCmtoM(height:String)->String{
        let heightNum = (height.split(separator: " "))
            let heightCm = Double(heightNum[0])!
            let heightM = Measurement(value: heightCm, unit: UnitLength.centimeters).converted(to: .meters)
            formatter.unitOptions = .providedUnit
            let heightMInString = formatter.string(from: heightM)
            let heightMNum = heightMInString.split(separator: " ")
            let heightMNum1 = Double(heightMNum[0])!
            let heightMNoDecimal = String(format: "%.0f", heightMNum1)
            return heightMNoDecimal
            
    //        return heightMInString
        }
        
    func convertKgToLbs(weight: String)-> String{
            
        let weightNum = (weight.split(separator: " "))
            let weightKg = Double(weightNum[0])!
            let weightLbs = Measurement(value: weightKg, unit: UnitMass.kilograms).converted(to: .pounds)
            formatter.unitOptions = .providedUnit
            let weightLbInString = formatter.string(from: weightLbs)
            let weightlbNum = weightLbInString.split(separator: " ")
            let weightLb = Double(weightlbNum[0])!
            let weightLbNoDecimal = String(format: "%.0f", weightLb)
            return weightLbNoDecimal
        }
        
    func convertLbToKg(weight:String)->String{
           
            let weightNum = (weight.split(separator: " "))
            let weightLbs = Double(weightNum[0])!
            let weightKg = Measurement(value: weightLbs, unit: UnitMass.pounds).converted(to: .kilograms)
            formatter.unitOptions = .providedUnit
            let weightKgInString = formatter.string(from: weightKg)
            let weightKgNum = weightKgInString.split(separator: " ")
            let weightKgNum1 = Double(weightKgNum[0])!
            let weightKgNoDecimal = String(format: "%.0f", weightKgNum1)
            return weightKgNoDecimal
        }

}
