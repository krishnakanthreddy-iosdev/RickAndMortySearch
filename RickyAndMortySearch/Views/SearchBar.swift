//
//  SearchBar.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import SwiftUI

/// A reusable search bar with a search field and clear button.
struct SearchBar: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            // Magnifying glass icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)

            // Search text field
            TextField("Search", text: $text)
                .focused($isFocused)
                .autocorrectionDisabled()
                .accessibilityIdentifier("Search") // ✅ For UI testing
                .accessibilityLabel("Search characters")
                .accessibilityHint("Type to search for characters by name")

            // Clear button (visible only when typing)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                    isFocused = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .accessibilityLabel("Clear search")
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

#Preview {
    PreviewContainer()
}

private struct PreviewContainer: View {
    @State private var searchText = ""
    
    var body: some View {
        SearchBar(text: $searchText)
    }
}
