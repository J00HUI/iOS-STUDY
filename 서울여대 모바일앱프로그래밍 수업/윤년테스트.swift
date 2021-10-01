// 윤년 : 4로 나누어 나머지가 없는 해는 윤년이나, 100으로 나누어지면 윤년이 아님, 400으로 나누어지면 윤년임
// 2018(윤년 아님), 2016(윤년임), 2100(윤년 아님), 2400(윤년임)

// Include Unit Test 체크 한 후 프로젝트 생성

// LeapTestTests.swift

import XCTest
@testable import LeapTest

class LeapTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testYear1(){
        let year: LeapYear! = LeapYear()
        let results: Bool = year.isLeapYear(year: 2018)   // 윤년 아님
        let expected: Bool = false
        XCTAssertEqual(results, expected)
        
    }
    func testYear2(){
        let year: LeapYear! = LeapYear()
        let results: Bool = year.isLeapYear(year: 2016)     // 윤년임
        let expected: Bool = true
        XCTAssertEqual(results, expected)
    
    }
    func testYear3(){
        let year: LeapYear! = LeapYear()
        let results: Bool = year.isLeapYear(year: 2100) // 윤년 아님
        let expected: Bool = false
        XCTAssertEqual(results, expected)
        
    }
    func testYear4(){
        let year: LeapYear! = LeapYear()
        let results: Bool = year.isLeapYear(year: 2400)     // 윤년임
        let expected: Bool = true
        XCTAssertEqual(results, expected)
    }

}


// LeapYear.swift 생성 

import Foundation

class LeapYear {
    
    func isLeapYear(year: Int) -> Bool {
        
        var result = false
        
        if year%4==0 {
            result = true
            
            if year % 100 == 0 {
                result = false
            }
            
            if year % 400 == 0 {
                result = true
            }
        }

        return result
        
    }

}
