//
//  SnapshotTester.swift
//  IpadcatsTests
//
//  Created by Nick Payne on 08/09/2022.
//

import XCTest
import SwiftUI

@testable import ipadcats
@testable import ipadcats_data

import SnapshotTesting

final class SnapshotTester: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

        func testSidebarSnapshotTest() throws {
            // UI tests must launch the application that they test.
           // let app = XCUIApplication()
           // app.launch()

            let appView = SidebarView()
                .environmentObject({ () -> AppPreferences in
                    let envObj = AppPreferences()
                    envObj.animalPreference = .cat
                    return envObj
                }())

            let view: UIView = UIHostingController(rootView: appView).view

            assertSnapshot(
              matching: view,
              as: .image(size: view.intrinsicContentSize))
        }
    }
