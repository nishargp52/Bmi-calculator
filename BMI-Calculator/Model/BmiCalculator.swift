//
//  BmiCalculator.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by nisharg patel on 2020-03-09.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

struct BmiCalculator {
    
    var bmi : Bmi?
    
    
    func getBmiValue()->String{
        let bmiValueInString = String(format: "%.2f",bmi?.value ?? "0.0" )
        
        return bmiValueInString
    }
    
    func getAdvice()->String{
        let advice = bmi?.advice ?? "Not available"
        return advice
    }
    
    func getColor()->UIColor{
        return bmi?.color ?? UIColor.white
    }
    
    
    mutating func calculateBmi(height:Float, weight:Float){
           
        let bmiValue = weight/(height * height)
        
        switch bmiValue {
        case 0 ... 18.5:
            bmi = Bmi(value: bmiValue, advice: "Eat More Pies", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        case 18.5 ... 24.9:
            bmi = Bmi(value: bmiValue, advice: "Fit as Fiddle", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        default:
            bmi = Bmi(value: bmiValue, advice: "Eat less Fries", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
        
    mutating func calculateLbBmi(height:Float, weight:Float){
       
        let lbBmiValue = 703 * (weight/(height * height))
        
        switch lbBmiValue {
        case 0 ... 18.5:
            bmi = Bmi(value: lbBmiValue, advice: "Eat More Pies", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        case 18.5 ... 24.9:
            bmi = Bmi(value: lbBmiValue, advice: "Fit as Fiddle", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        default:
            bmi = Bmi(value: lbBmiValue, advice: "Eat less Fries", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    }
        
}
    

}
