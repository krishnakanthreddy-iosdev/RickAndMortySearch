//
//  CharacterList.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import SwiftUI

/// Displays a list of characters with navigation to their detail views.
struct CharacterList: View {
    let characters: [Character]

    var body: some View {
        List(characters) { character in
            NavigationLink(destination: CharacterDetailView(character: character)) {
                CharacterRowView(character: character)
            }
            .padding(.vertical, 4)
        }
        .listStyle(.plain)
    }
}
