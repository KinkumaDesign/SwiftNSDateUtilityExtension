//
//  NSDate+DateUtil.swift
//
//  Created by Maeda Tasuku on 1/30/16.
//  Copyright © 2016 Kinkuma Design. All rights reserved.
//

import Foundation

extension NSDate {
    private static var _grecorianCalender:NSCalendar!
    
    class func dateWithYear(year:Int, month:Int, day:Int, hour:Int = 0, minute:Int = 0, second:Int = 0, nanosecond:Int = 0)-> NSDate {
        let date:NSDate = NSDate()
        let comps:NSDateComponents = date.gregorianCalendar.components(
            [.Year, .Month, .Day, .Hour, .Minute, .Second, .Nanosecond], fromDate: date)
        comps.year = year
        comps.month = month
        comps.day = day
        comps.hour = hour
        comps.minute = minute
        comps.second = second
        comps.nanosecond = nanosecond
        return date.gregorianCalendar.dateFromComponents(comps)!
    }
    
    var gregorianCalendar:NSCalendar {
        if NSDate._grecorianCalender == nil {
            let cal:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            cal.timeZone = NSTimeZone.localTimeZone()
            NSDate._grecorianCalender = cal
        }
        return NSDate._grecorianCalender
    }
    
    var currentDateFormatter:NSDateFormatter {
        let formatter:NSDateFormatter = NSDateFormatter()
        formatter.locale = NSLocale.currentLocale()
        formatter.timeZone = NSTimeZone.localTimeZone()
        formatter.dateStyle = NSDateFormatterStyle.NoStyle
        formatter.timeStyle = NSDateFormatterStyle.NoStyle
        return formatter
    }
    
    /**
     * Sunday = 1, Monday = 2, ....
     */
    var firstWeekdayInMonth:Int {
        let cal:NSCalendar = self.gregorianCalendar
        let unitFlags: NSCalendarUnit = [.Year, .Month, .Day]
        let comps:NSDateComponents = cal.components(unitFlags, fromDate: self)
        comps.day = 1
        let firstDay:NSDate = cal.dateFromComponents(comps)!
        return cal.components(NSCalendarUnit.Weekday, fromDate: firstDay).weekday
    }
    
    var weekday:Int {
        return self.gregorianCalendar
            .components(NSCalendarUnit.Weekday, fromDate: self).weekday
    }
    
    var numberOfDaysInMonth:Int {
        return self.gregorianCalendar.rangeOfUnit(NSCalendarUnit.Day,
                                                  inUnit: NSCalendarUnit.Month,
                                                  forDate: self).length
    }
    
    var numberOfWeekInMonth:Int {
        return self.gregorianCalendar.rangeOfUnit(NSCalendarUnit.WeekOfMonth,
                                                  inUnit: NSCalendarUnit.Month,
                                                  forDate: self).length
    }
    
    func daysToDate(endDate:NSDate)-> Int {
        let units:NSCalendarUnit = [.Era, .Year, .Month, .Day]
        let cal:NSCalendar = self.gregorianCalendar
        let comps1:NSDateComponents = cal.components(units, fromDate: self)
        let comps2:NSDateComponents = cal.components(units, fromDate: endDate)
        comps1.hour = 12
        comps2.hour = 12
        let date1:NSDate = cal.dateFromComponents(comps1)!
        let date2:NSDate = cal.dateFromComponents(comps2)!
        return cal.components(NSCalendarUnit.Day, fromDate: date1, toDate: date2,
            options: NSCalendarOptions(rawValue: 0)).day
    }
    
    var yearMonthDayComponents:NSDateComponents {
        return self.gregorianCalendar.components([.Year, .Month, .Day], fromDate: self)
    }
    
    var yearMonthComponents:NSDateComponents {
        return self.gregorianCalendar.components([.Year, .Month], fromDate: self)
    }
    
    var weekdayComponents:NSDateComponents {
        return self.gregorianCalendar.components([.Weekday], fromDate: self)
    }
    
    var hourMinuteSecondComponents:NSDateComponents {
        return self.gregorianCalendar.components([.Hour, .Minute, .Second], fromDate: self)
    }
    
    var year:Int {
        return self.yearMonthComponents.year
    }
    
    var month:Int {
        return self.yearMonthComponents.month
    }
    
    var day:Int {
        return self.yearMonthDayComponents.day
    }
    
    var hour:Int {
        return self.hourMinuteSecondComponents.hour
    }
    
    var minute:Int {
        return self.hourMinuteSecondComponents.minute
    }
    
    var second:Int {
        return self.hourMinuteSecondComponents.second
    }
    
    var nanoSecond:Int{
        return self.gregorianCalendar.component(NSCalendarUnit.Nanosecond, fromDate: self)
    }
    
    public func setYear(value:Int) -> NSDate {
        return NSDate.dateWithYear(value, month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: self.second, nanosecond: self.nanoSecond)
    }
    
    public func setMonth(value:Int) -> NSDate {
        return NSDate.dateWithYear(self.year, month: value, day: self.day, hour: self.hour, minute: self.minute, second: self.second, nanosecond: self.nanoSecond)
    }
    
    public func setDay(value:Int) -> NSDate {
        return NSDate.dateWithYear(self.year, month: self.month, day: value, hour: self.hour, minute: self.minute, second: self.second, nanosecond: self.nanoSecond)
    }
    
    public func setHour(value:Int) -> NSDate {
        return NSDate.dateWithYear(self.year, month: self.month, day: self.day, hour: value, minute: self.minute, second: self.second, nanosecond: self.nanoSecond)
    }
    
    public func setMinute(value:Int) -> NSDate {
        return NSDate.dateWithYear(self.year, month: self.month, day: self.day, hour: self.hour, minute: value, second: self.second, nanosecond: self.nanoSecond)
    }
    
    public func setSecond(value:Int) -> NSDate {
        return NSDate.dateWithYear(self.year, month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: value, nanosecond: self.nanoSecond)
    }
    
    public func setNanosecond(value:Int) -> NSDate {
        return NSDate.dateWithYear(self.year, month: self.month, day: self.day, hour: self.hour, minute: self.minute, second: self.second, nanosecond: value)
    }
    
    var nextDate:NSDate {
        let comps:NSDateComponents = self.yearMonthDayComponents
        comps.day = comps.day + 1
        return self.gregorianCalendar.dateFromComponents(comps)!
    }
    
    var previousDate:NSDate {
        let comps:NSDateComponents = self.yearMonthDayComponents
        comps.day = comps.day - 1
        return self.gregorianCalendar.dateFromComponents(comps)!
    }
    
    var dayString:String {
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateFormat = "d"
        return formatter.stringFromDate(self)
    }
    
    var yearMonthString:String {
        let formatString:String = NSDateFormatter.dateFormatFromTemplate(
            "yyyyMMMM", options: 0, locale: NSLocale.currentLocale())!
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateFormat = formatString
        return formatter.stringFromDate(self)
    }
    
    var yearMonthDayString:String {
        let formatString:String = NSDateFormatter.dateFormatFromTemplate(
            "yyyyMMMMdd", options: 0, locale: NSLocale.currentLocale())!
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateFormat = formatString
        return formatter.stringFromDate(self)
    }
    
    var yearMonthDayWeekdayString:String {
        let formatString:String = NSDateFormatter.dateFormatFromTemplate(
            "yyyyMMMMddEE", options: 0, locale: NSLocale.currentLocale())!
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateFormat = formatString
        return formatter.stringFromDate(self)
    }
    
    var yearMonthDayStringShortStyle:String {
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        let yearMonthDate:NSDate = self.gregorianCalendar.dateFromComponents(self.yearMonthDayComponents)!
        return formatter.stringFromDate(yearMonthDate)
    }
    
    var yearMonthDayStringMediumStyle:String {
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let yearMonthDate:NSDate = self.gregorianCalendar.dateFromComponents(self.yearMonthDayComponents)!
        return formatter.stringFromDate(yearMonthDate)
    }
    
    func stringWithDateFormatterStyle(style:NSDateFormatterStyle)-> String {
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateStyle = style
        return formatter.stringFromDate(self)
    }
    
    func stringWithDateFormatString(formatString:String)-> String {
        let formatter:NSDateFormatter = self.currentDateFormatter
        formatter.dateFormat = formatString
        return formatter.stringFromDate(self)
    }
    
    func dateByAddingComponents(offsetComponents:NSDateComponents)-> NSDate {
        return self.gregorianCalendar.dateByAddingComponents(offsetComponents,
            toDate: self, options: NSCalendarOptions(rawValue: 0))!
    }
}
