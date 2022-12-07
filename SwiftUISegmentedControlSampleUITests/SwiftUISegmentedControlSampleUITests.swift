//
//	SwiftUISegmentedControlSampleUITests.swift
//  SwiftUISegmentedControlSampleUITests
//
//  Created by Juan Mueller on 12/7/22.
//  For more, visit www.ajourneyforwisdom.com
//

import XCTest

final class SwiftUISegmentedControlSampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSelectsImageCorrectly() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let starters = ["Bulbasaur", "Charmander", "Squirtle"]
        
        sleep(1)
        
        let picker = app.segmentedControls["starterPicker"]
        let starterName = app.staticTexts["starterName"]
        
        let starter1 = app.images["starter1"]
        
        starter1.tap()
        
        sleep(1)
        
        let pickerButton = picker.buttons.element(boundBy: 0)
        
        XCTAssertTrue(pickerButton.isSelected, "Element is not selected")
        XCTAssertEqual(starters[0], starterName.label)
        
        sleep(1)
    }
    
    func testSelectsPickerCorrectly() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let starters = ["Bulbasaur", "Charmander", "Squirtle"]
        
        sleep(1)
        
        let picker = app.segmentedControls["starterPicker"]
        let starterName = app.staticTexts["starterName"]
        
        let pickerButton = picker.buttons.element(boundBy: 2)
        
        pickerButton.tap()
        
        sleep(1)
        
        XCTAssertTrue(pickerButton.isSelected, "Element is not selected")
        XCTAssertEqual(starters[2], starterName.label)
        
        sleep(1)
    }
}
