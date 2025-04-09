//
//  CharacterListView.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        VStack(spacing: 12) {
            SearchBar(text: $viewModel.searchQuery)
            
            if viewModel.statusFilter != .all {
                Text("Filtered by: \(viewModel.statusFilter.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            if viewModel.isLoading {
                ProgressView()
            }

            CharacterList(characters: viewModel.characters)
        }
        .navigationTitle("Rick & Morty")
        .toolbar {
            Menu {
                ForEach(CharacterStatusFilter.allCases, id: \.self) { filter in
                    Button(filter.rawValue) {
                        viewModel.statusFilter = filter
                        viewModel.fetchCharacters(for: viewModel.searchQuery)
                    }
                }
            } label: {
                Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
            }
        }
    }
}
