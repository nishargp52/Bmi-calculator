//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculator = BmiCalculator()
    var unitConverter = unitConverterBrain()
    let formatter = MeasurementFormatter()
    
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightUnitControl: UISegmentedControl!
    
    @IBOutlet weak var weightUnitControl: UISegmentedControl!
    
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBAction func heightUnitChanged(_ sender: UISegmentedControl) {
        let unit = heightUnitControl.selectedSegmentIndex
        let height = heightLabel.text!
        
        if unit == 1 {
            let height = unitConverter.convertMtoCm(height: height)
            heightLabel.text = "\(height) cm"
            heightSlider.maximumValue = 300
            heightSlider.value = Float(height)!
            
            
        }
        else {
            let height = unitConverter.convertCmtoM(height: height)
            let heightwithdecimal = String(format:"%.2f", Double(height)!)
            heightLabel.text = "\(heightwithdecimal) M"
            heightSlider.maximumValue = 3
            heightSlider.value = Float(height)!
        }
    }
    
    @IBAction func weightUnitChanged(_ sender: UISegmentedControl) {
        let unit = weightUnitControl.selectedSegmentIndex
        let weight = weightLabel.text!
            if unit == 1 {
                let weight = unitConverter.convertKgToLbs(weight: weight)
                weightLabel.text = "\(weight) Lb"
                weightSlider.maximumValue = 700
                weightSlider.value = Float(weight)!
                
                
            }
            else {
                let weight = unitConverter.convertLbToKg(weight: weight)
                weightLabel.text = "\(weight) Kg"
                weightSlider.maximumValue = 300
                weightSlider.value = Float(weight)!
            }
        }
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        if heightUnitControl.selectedSegmentIndex == 0 {
            let height = String(format: "%.2f", sender.value)
            heightLabel.text = "\(height) M"
        } else {
            let height = String(format: "%.0f", sender.value)
            heightLabel.text = "\(height) cm"
        }
    }
        
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        if weightUnitControl.selectedSegmentIndex == 0 {
            let weight = String(format: "%.0f", sender.value)
            weightLabel.text = "\(weight) Kg"
        } else {
            let weight = String(format: "%.0f", sender.value)
            weightLabel.text = "\(weight) Lb"
        }
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        if weightUnitControl.selectedSegmentIndex == 0 && heightUnitControl.selectedSegmentIndex == 0 {
        calculator.calculateBmi(height: height, weight: weight)
        }
            else if weightUnitControl.selectedSegmentIndex == 0 && heightUnitControl.selectedSegmentIndex == 1{
            let newHeight = height/100
            calculator.calculateBmi(height: newHeight, weight: weight)
        }
            else if weightUnitControl.selectedSegmentIndex == 1 && heightUnitControl.selectedSegmentIndex == 0 {
            let newHeight = height * 39.37
            calculator.calculateLbBmi(height: newHeight, weight: weight)
        } else{
            let newHeight = height / 2.54
            calculator.calculateLbBmi(height: newHeight, weight: weight)
        }
        self.performSegue(withIdentifier: "results", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightUnitControl.selectedSegmentIndex = 0
        weightUnitControl.selectedSegmentIndex = 0
        let heightValue = String(format: "%.2f", Double(heightSlider.value))
        heightLabel.text = "\(heightValue) M"
        let weightValue = String(format: "%.0f", Double(weightSlider.value))
        weightLabel.text = "\(weightValue) Kg"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = calculator.getBmiValue()
            destinationVC.advice = calculator.getAdvice()
            destinationVC.color = calculator.getColor()
            
        }
       }
}

