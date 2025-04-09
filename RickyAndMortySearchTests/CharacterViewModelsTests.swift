//
//  CharacterViewModelsTests.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import XCTest
import Combine
@testable import RickyAndMortySearch

final class CharacterViewModelsTests: XCTestCase {
    
    private var viewModel: CharacterViewModel!
    private var cancellables: Set<AnyCancellable>!
    
    @MainActor
    override func setUp() {
        super.setUp()
        viewModel = CharacterViewModel()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    /// Verifies that entering an empty query clears the character list.
    @MainActor
    func testEmptySearchQueryClearsCharacters() async {
        // Arrange
        viewModel.characters = [
            Character(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                origin: Origin(name: "Earth"),
                image: "",
                created: "2017-11-04T18:48:46.250Z"
            )
        ]
        
        // Act
        viewModel.searchQuery = ""
        
        // Wait for debounce
        try? await Task.sleep(nanoseconds: 600_000_000) // 0.6s
        
        // Assert
        XCTAssertTrue(viewModel.characters.isEmpty, "Expected character list to be empty after clearing search query.")
    }
    
    /// Optionally test valid queries if mock services are added later
    func testSearchQueryTriggersFetch() {
        // This would require dependency injection and mocking APIService
        // Add if needed using a protocol + mock service pattern
    }
}
