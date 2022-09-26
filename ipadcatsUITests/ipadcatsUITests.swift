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

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCorrectNumberOfImagesLoaded() throws {
        // is there a better way to do this?
        if UIDevice.current.userInterfaceIdiom == .pad {
            let app = XCUIApplication()
            app.launch()

            app.buttons["gridView"].tap()

            // this is the bit that only works when using an iPad to run tests
            app.scrollViews["gridScroll"].scroll(byDeltaX: 0, deltaY: 100)

            XCTAssertTrue(app.images.element.waitForExistence(timeout: 5))
            XCTAssertEqual(app.images.count, 25)
        }
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
