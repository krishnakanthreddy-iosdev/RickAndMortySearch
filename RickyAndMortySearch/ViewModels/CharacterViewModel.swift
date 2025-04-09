//
//  CharacterViewModel.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import Foundation
import Combine

@MainActor
final class CharacterViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var characters: [Character] = []
    @Published var searchQuery: String = ""
    @Published var isLoading: Bool = false
    @Published var statusFilter: CharacterStatusFilter = .all
    
    // MARK: - Private
    private var cancellables = Set<AnyCancellable>()
    private let apiService: APIService
    
    // MARK: - Init
    init(apiService: APIService = ServiceContainer.shared.apiService) {
        self.apiService = apiService
        bindSearchQuery()
    }
    
    // MARK: - Public Methods
    func fetchCharacters(for name: String) {
        guard !name.isEmpty else {
            characters = []
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let results = try await apiService.fetchCharacters(name: name)
                
                // Apply status filter
                let filteredResults: [Character]
                switch statusFilter {
                case .all:
                    filteredResults = results
                default:
                    filteredResults = results.filter {
                        $0.status.lowercased() == statusFilter.rawValue.lowercased()
                    }
                }
                
                characters = filteredResults
            } catch {
                characters = []
            }
            isLoading = false
        }
    }
    
    // MARK: - Private Methods
    private func bindSearchQuery() {
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.fetchCharacters(for: query)
            }
            .store(in: &cancellables)
    }
}

// MARK: - Status Filter Enum
enum CharacterStatusFilter: String, CaseIterable {
    case all = "All"
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}
