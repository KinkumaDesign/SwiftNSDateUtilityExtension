//
//  NSDate+DateUtilTests.swift
//  SwiftNSDateUtilityExtension
//
//  Created by Maeda Tasuku on 1/30/16.
//  Copyright © 2016 Kinkuma Design. All rights reserved.
//

import XCTest
@testable import SwiftNSDateUtilityExtension

class NSDateDateUtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_dateWithYear(){
        let cal:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        cal.timeZone = NSTimeZone.localTimeZone()
        
        let date1:NSDate = NSDate.dateWithYear(2016, month: 1, day: 30)
        let comps1:NSDateComponents = NSDateComponents()
        comps1.year = 2016
        comps1.month = 1
        comps1.day = 30
        let date1_1:NSDate = cal.dateFromComponents(comps1)!
        XCTAssertTrue(date1.isEqualToDate(date1_1))
        
        let date2:NSDate = NSDate.dateWithYear(2015, month: 12, day: 4, hour: 15, minute: 32, second: 13, nanosecond: 1234)
        let comps2:NSDateComponents = NSDateComponents()
        comps2.year = 2015
        comps2.month = 12
        comps2.day = 4
        comps2.hour = 15
        comps2.minute = 32
        comps2.second = 13
        comps2.nanosecond = 1234
        let date2_1:NSDate = cal.dateFromComponents(comps2)!
        XCTAssertTrue(date2.compare(date2_1) == NSComparisonResult.OrderedSame)
    }
    
    func test_gregorianCalendar() {
        let date:NSDate = NSDate()
        XCTAssertNotNil(date.gregorianCalendar)
    }
    
    func test_currentDateFormatter() {
        let date:NSDate = NSDate()
        XCTAssertNotNil(date.currentDateFormatter)
    }
    
    func test_firstWeekdayInMonth() {
        let date:NSDate = NSDate.dateWithYear(2016, month: 1, day: 30)
        let weekday:Int = date.firstWeekdayInMonth
        XCTAssertEqual(weekday, 6)
    }
    
    func test_weekday() {
        let date:NSDate = NSDate.dateWithYear(2016, month: 1, day: 26)
        XCTAssertEqual(date.weekday, 3)
    }
    
    func test_numberOfDaysInMonth() {
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 17)
        XCTAssertEqual(date.numberOfDaysInMonth, 29)
    }
    
    func test_numberOfWeekInMonth(){
        let date:NSDate = NSDate.dateWithYear(2016, month: 2, day: 17)
        XCTAssertEqual(date.numberOfWeekInMonth, 5)
    }
    
    func test_daysToDate(){
        let date1_1:NSDate = NSDate.dateWithYear(2016, month: 1, day: 1)
        
        let date1_2:NSDate = NSDate.dateWithYear(2016, month: 1, day: 1)
        XCTAssertEqual(date1_1.daysToDate(date1_2), 0)
        
        let date1_3:NSDate = NSDate.dateWithYear(2016, month: 1, day: 2)
        XCTAssertEqual(date1_1.daysToDate(date1_3), 1)
        
        let date1_4:NSDate = NSDate.dateWithYear(2015, month: 12, day: 31)
        XCTAssertEqual(date1_1.daysToDate(date1_4), -1)
        
        let date1_5:NSDate = NSDate.dateWithYear(2015, month: 12, day: 30)
        XCTAssertEqual(date1_1.daysToDate(date1_5), -2)
        
        let date1_6:NSDate = NSDate.dateWithYear(2016, month: 2, day: 5)
        XCTAssertEqual(date1_1.daysToDate(date1_6), 30 + 5)
    }
    
    func test_yearMonthDayComponents(){
        let comps:NSDateComponents = NSDate().yearMonthDayComponents
        XCTAssertNotEqual(comps.year, NSDateComponentUndefined)
        XCTAssertNotEqual(comps.month, NSDateComponentUndefined)
        XCTAssertNotEqual(comps.day, NSDateComponentUndefined)
        XCTAssertEqual(comps.weekday, NSDateComponentUndefined)
        XCTAssertEqual(comps.hour, NSDateComponentUndefined)
        XCTAssertEqual(comps.minute, NSDateComponentUndefined)
        XCTAssertEqual(comps.second, NSDateComponentUndefined)
        XCTAssertEqual(comps.nanosecond, NSDateComponentUndefined)
    }
    
    func test_yearMonthComponents(){
        let comps:NSDateComponents = NSDate().yearMonthComponents
        XCTAssertNotEqual(comps.year, NSDateComponentUndefined)
        XCTAssertNotEqual(comps.month, NSDateComponentUndefined)
        XCTAssertEqual(comps.day, NSDateComponentUndefined)
        XCTAssertEqual(comps.weekday, NSDateComponentUndefined)
        XCTAssertEqual(comps.hour, NSDateComponentUndefined)
        XCTAssertEqual(comps.minute, NSDateComponentUndefined)
        XCTAssertEqual(comps.second, NSDateComponentUndefined)
        XCTAssertEqual(comps.nanosecond, NSDateComponentUndefined)
    }
    
    func test_weekdayComponents(){
        let comps:NSDateComponents = NSDate().weekdayComponents
        XCTAssertEqual(comps.year, NSDateComponentUndefined)
        XCTAssertEqual(comps.month, NSDateComponentUndefined)
        XCTAssertEqual(comps.day, NSDateComponentUndefined)
        XCTAssertNotEqual(comps.weekday, NSDateComponentUndefined)
        XCTAssertEqual(comps.hour, NSDateComponentUndefined)
        XCTAssertEqual(comps.minute, NSDateComponentUndefined)
        XCTAssertEqual(comps.second, NSDateComponentUndefined)
        XCTAssertEqual(comps.nanosecond, NSDateComponentUndefined)
    }
    
    func test_year(){
        let date1 = NSDate.dateWithYear(2016, month: 1, day: 30)
        XCTAssertEqual(date1.year, 2016)
    }
    
    func test_month(){
        let date1 = NSDate.dateWithYear(2016, month: 3, day: 7)
        XCTAssertEqual(date1.month, 3)
    }
    
    func test_day(){
        let date1 = NSDate.dateWithYear(2016, month: 3, day: 7)
        XCTAssertEqual(date1.day, 7)
    }
    
    func test_setYear(){
        let date1 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 35)
        let date2 = date1.setYear(2011)
        let date3 = NSDate.dateWithYear(2011, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 35)
        XCTAssertTrue(date2.compare(date3) == NSComparisonResult.OrderedSame)
    }
    
    func test_setMonth(){
        let date1 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 1000000)
        let date2 = date1.setMonth(10)
        let date3 = NSDate.dateWithYear(2015, month: 10, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 1000000)
        XCTAssertTrue(date2.compare(date3) == NSComparisonResult.OrderedSame)
    }
    
    func test_setDay(){
        let date1 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 1000000)
        let date2 = date1.setDay(13)
        let date3 = NSDate.dateWithYear(2015, month: 2, day: 13, hour: 13, minute: 24, second: 34, nanosecond: 1000000)
        XCTAssertTrue(date2.compare(date3) == NSComparisonResult.OrderedSame)
    }
    
    func test_setHour(){
        let date1 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 1000000)
        let date2 = date1.setHour(23)
        let date3 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 23, minute: 24, second: 34, nanosecond: 1000000)
        XCTAssertTrue(date2.compare(date3) == NSComparisonResult.OrderedSame)
    }
    
    func test_setMinute(){
        let date1 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 1000000)
        let date2 = date1.setMinute(5)
        let date3 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 5, second: 34, nanosecond: 1000000)
        XCTAssertTrue(date2.compare(date3) == NSComparisonResult.OrderedSame)
    }
    
    func test_setSecond(){
        let date1 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 1000000)
        let date2 = date1.setSecond(12)
        let date3 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 12, nanosecond: 1000000)
        XCTAssertTrue(date2.compare(date3) == NSComparisonResult.OrderedSame)
    }
    
    func test_setNanoecond(){
        let date1 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 11000000)
        let date2 = date1.setNanosecond(22000000)
        let date3 = NSDate.dateWithYear(2015, month: 2, day: 3, hour: 13, minute: 24, second: 34, nanosecond: 22000000)
        XCTAssertTrue(date2.compare(date3) == NSComparisonResult.OrderedSame)
    }
    
    func test_nextDate(){
        let date1 = NSDate.dateWithYear(2016, month: 3, day: 3)
        let date2 = NSDate.dateWithYear(2016, month: 3, day: 4)
        XCTAssertTrue(date1.nextDate.compare(date2) == NSComparisonResult.OrderedSame)
    }
    
    func test_previousDate(){
        let date1 = NSDate.dateWithYear(2016, month: 3, day: 1)
        let date2 = NSDate.dateWithYear(2016, month: 2, day: 29)
        XCTAssertTrue(date1.previousDate.compare(date2) == NSComparisonResult.OrderedSame)
    }
    
    func test_dayString(){
        let date1 = NSDate.dateWithYear(2016, month: 3, day: 4)
        XCTAssertEqual(date1.dayString, "4")
    }
    
    func test_yearMonthString(){
        let date1 = NSDate.dateWithYear(2016, month: 3, day: 4)
        XCTAssertEqual(date1.yearMonthString, "March 2016")
    }
    
    func test_dateByAddingComponents(){
        let date1 = NSDate.dateWithYear(2016, month: 2, day: 6)
        let comps2:NSDateComponents = NSDateComponents()
        comps2.month = 1
        let date2:NSDate = date1.dateByAddingComponents(comps2)
        let date2_1:NSDate = NSDate.dateWithYear(2016, month: 3, day: 6)
        XCTAssertTrue(date2.isEqualToDate(date2_1))
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}