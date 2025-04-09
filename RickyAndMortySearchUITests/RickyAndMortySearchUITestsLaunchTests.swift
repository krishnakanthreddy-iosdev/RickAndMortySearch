//
//  RickyAndMortySearchUITestsLaunchTests.swift
//  RickyAndMortySearchUITests
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import XCTest

final class RickyAndMortySearchUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    /// Measures how long it takes to launch the app.
    func testLaunchPerformance() throws {
        // Only run on supported platforms
        if #available(iOS 16.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
