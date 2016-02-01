//
//  ViewController.swift
//  SwiftNSDateUtilityExtension
//
//  Created by Maeda Tasuku on 2/1/16.
//  Copyright © 2016 Kinkuma Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let example:ExampleDateUtil =  ExampleDateUtil()
        example.dateWithYear()
        
        example.firstWeekdayInMonth()
        
        example.numberOfDaysInMonth()
        
        example.numberOfWeekInMonth()
        
        example.dateComponents()
        
        example.nextPreviousDate()
        
        example.daysToDate()
        
        example.toStringDateMethods()
        
        example.dateByAddingComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

