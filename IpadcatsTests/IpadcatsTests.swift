//
//  IpadcatsTests.swift
//  IpadcatsTests
//
//  Created by Nick Payne on 22/06/2022.
//

import XCTest
@testable import ipadcats_data

final class IpadcatsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFavouriteEquality() throws {
        let fav1 = Favourite(code: 100, animal: .dog)
        let fav2 = Favourite(code: 100, animal: .cat)
        
        XCTAssertNotEqual(fav1, fav2)
    }

}
