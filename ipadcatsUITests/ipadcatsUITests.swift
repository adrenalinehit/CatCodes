//
//  ipadcatsUITests.swift
//  ipadcatsUITests
//
//  Created by Nick Payne on 22/06/2022.
//

import XCTest

final class IpadcatsUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCorrectNumberOfImagesLoaded() throws {
        let app = XCUIApplication()
        app.launch()
        
        if app.buttons["ToggleSidebar"].exists {
            app.buttons["ToggleSidebar"].tap()
        }
        
        app.buttons["gridView"].tap()
        app.scrollViews["gridScroll"].swipeUp(velocity: .fast)
        app.scrollViews["gridScroll"].swipeUp(velocity: .fast)
        
        XCTAssertTrue(app.images.element.waitForExistence(timeout: 5))
        XCTAssertEqual(app.scrollViews["gridScroll"].images.count, 25)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
