//
//  ExsampleDateUtil.swift
//  SwiftNSDateUtilityExtension
//
//  Created by Maeda Tasuku on 2/1/16.
//  Copyright © 2016 Kinkuma Design. All rights reserved.
//

import Foundation

class ExampleDateUtil{
    func dateWithYear(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 1)
        print("date = \(date.yearMonthDayString)") //February 01, 2016
        
        let date2:NSDate = NSDate.dateWithYear(2016, month: 2, day: 3, hour: 18, minute: 30, second: 25)
        let date2Str:String = date2.stringWithDateFormatString("yyyy/MM/dd HH:mm:ss")
        print("date2 = \(date2Str)") //2016/02/03 18:30:25
    }
    
    func firstWeekdayInMonth(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 18)
        print("first week day in Feb. 2016 = \(date.firstWeekdayInMonth)")
        //first week day in Feb. 2016 = 2
        
        //Sunday = 1, Monday = 2, ....
    }
    
    func numberOfDaysInMonth(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 18)
        print("number of days in Feb. 2016 = \(date.numberOfDaysInMonth)") //29
    }
    
    func numberOfWeekInMonth(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 18)
        print("number of week in Feb. 2016 = \(date.numberOfWeekInMonth)") //5
    }
    
    func dateComponents(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 3, hour: 15, minute: 30, second: 25)
        print("year: \(date.year)")
        print("month: \(date.month)")
        print("day: \(date.day)")
        print("weekday: \(date.weekday)")
        print("hour \(date.hour)")
        print("minute \(date.minute)")
        print("second \(date.second)")
        print("nanosecond \(date.nanoSecond)")
    }
    
    func nextPreviousDate(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 1)
        let nextDate:NSDate = date.nextDate
        let previousDate:NSDate = date.previousDate
        
        print("next date: \(nextDate.yearMonthDayString)") //February 02, 2016
        print("previous date: \(previousDate.yearMonthDayString)") //January 31, 2016
    }
    
    func daysToDate(){
        let startDate:NSDate = NSDate.dateWithYear(2016, month: 2, day: 1)
        let endDate:NSDate = NSDate.dateWithYear(2016, month: 2, day: 4)
        let days:Int = startDate.daysToDate(endDate)
        
        print("\(endDate.stringWithDateFormatString("yyyy/MM/dd")) - \(startDate.stringWithDateFormatString("yyyy/MM/dd")) = \(days)")
        //2016/02/04 - 2016/02/01 = 3
    }
    
    func toStringDateMethods(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 3, hour: 15, minute: 32, second: 24)
        print("\(date.yearMonthString)") //February 2016
        print("\(date.yearMonthDayString)") //February 03, 2016
        print("\(date.yearMonthDayWeekdayString)") //Wed, February 03, 2016
        print("\(date.yearMonthDayStringShortStyle)") // 2/3/16
        print("\(date.yearMonthDayStringMediumStyle)") //Feb 3, 2016
        
        print("\(date.stringWithDateFormatterStyle(NSDateFormatterStyle.FullStyle))") //Wednesday, February 3, 2016
        print("\(date.stringWithDateFormatString("yyyy/MM/dd HH:mm:ss"))") //2016/02/03 15:32:24
    }
    
    func dateByAddingComponents(){
        let date1:NSDate = NSDate.dateWithYear(2016, month: 2, day: 1)
        let comp1:NSDateComponents = NSDateComponents()
        comp1.day = 5
        let date2:NSDate = date1.dateByAddingComponents(comp1)
        
        print("date2 \(date2.yearMonthDayString)") //February 06, 2016
    }
}