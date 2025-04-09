//
//  CharacterRowView.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import SwiftUI

/// Displays a single row with a character's image, name, and species.
struct CharacterRowView: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 12) {
            // Image thumbnail
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .clipped()
                    .accessibilityHidden(true) // image info is already in label
            } placeholder: {
                ProgressView()
                    .frame(width: 60, height: 60)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            // Textual info
            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text(character.species)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(character.name), \(character.species)")
        .accessibilityHint("Double tap to view details")
    }
}

// MARK: - Preview
struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            origin: Origin(name: "Earth"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            created: "2017-11-04T18:48:46.250Z"
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
