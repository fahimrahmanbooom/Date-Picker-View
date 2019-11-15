//
//  ViewController.swift
//  Age Calculator
//
//  Created by Fahim Rahman on 15/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }

    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateOfBirthPicker.setValue(UIColor.white, forKey: "textColor")
        dateOfBirthPicker.setValue(false, forKey: "highlightsToday")
        ageLabel.text = "How Old Are You?"
    }
    
    @IBAction func getMyAgeButton(_ sender: UIButton) {
        age()
    }
    
    func age() {
        
        // Formatting the date of birth
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy"
        
        // getting the current calender
        let calender = Calendar.current
        
        // getting the range from date of birth to the current calender
        let dateComponent = calender.dateComponents([.day, .month, .year], from: dateOfBirthPicker.date, to: Date())
        
        // Checking singular or plural then sending the output
        var year = "Years"
        var month = "Months"
        var day = "Days"
        
        if dateComponent.year! < 2 {
            year = "Year"
        }
        if dateComponent.month! < 2 {
            month = "Month"
        }
        if dateComponent.day! < 2 {
            day = "Day"
        }
        ageLabel.text = "\(dateComponent.year!) \(year), \(dateComponent.month!) \(month), \(dateComponent.day!) \(day)"
    }
}
