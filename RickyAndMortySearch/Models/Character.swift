//
//  Character.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import Foundation

// Response wrapper for the character list API
struct CharacterResponse: Codable {
    let results: [Character]
}

// Model for a single character
struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let origin: Origin
    let image: String
    let created: String
}

// Nested model for the character's origin info
struct Origin: Codable {
    let name: String
}
