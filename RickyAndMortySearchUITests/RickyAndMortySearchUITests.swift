//
//  RickyAndMortySearchUITests.swift
//  RickyAndMortySearchUITests
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import XCTest

final class RickyAndMortySearchUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testSearchAndNavigateToDetail() {
        // Access the search field using the accessibility identifier
        let searchField = app.textFields["Search"]
        XCTAssertTrue(searchField.exists, "Search field should exist on screen")
        
        // Tap and type query
        searchField.tap()
        searchField.typeText("Rick")
        
        // Wait to allow debounce & network call to complete
        sleep(1) // You can improve this with expectations later
        
        // Tap first search result
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 3), "First cell should appear after search")
        firstCell.tap()
        
        // Assert navigation to detail view
        let detailTitle = app.staticTexts["Rick Sanchez"]
        XCTAssertTrue(detailTitle.waitForExistence(timeout: 2), "Character detail screen should be visible")
    }
}
