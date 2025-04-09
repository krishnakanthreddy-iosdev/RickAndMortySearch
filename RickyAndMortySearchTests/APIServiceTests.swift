//
//  APIServiceTests.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import XCTest
@testable import RickyAndMortySearch

final class APIServiceTests: XCTestCase {
    
    private var apiService: APIService!
    
    override func setUp() {
        super.setUp()
        apiService = APIService()
    }
    
    override func tearDown() {
        apiService = nil
        super.tearDown()
    }
    
    /// Tests that the API successfully returns character results for a valid name.
    func testFetchCharacters_returnsCharactersForValidQuery() async throws {
        // Arrange
        let query = "Rick"
        
        // Act
        let characters = try await apiService.fetchCharacters(name: query)
        
        // Assert
        XCTAssertFalse(characters.isEmpty, "Expected non-empty result for valid query.")
        XCTAssertTrue(characters.contains { $0.name.contains("Rick") })
    }
    
    /// Tests that the API throws an error for a gibberish name query.
    func testFetchCharacters_throwsErrorForInvalidQuery() async {
        // Arrange
        let query = "thisshouldnotmatchanything123"
        
        do {
            // Act
            _ = try await apiService.fetchCharacters(name: query)
            XCTFail("Expected error for unmatched query but got result.")
        } catch {
            // Assert
            XCTAssertTrue(error is URLError || error is DecodingError || error.localizedDescription.contains("not found"), "Unexpected error type: \(error)")
        }
    }
}
