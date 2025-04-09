//
//  ContentView.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import SwiftUI

/// The root view of the app. Hosts the character search flow and navigation stack.
struct ContentView: View {
    var body: some View {
        NavigationStack {
            CharacterListView()
        }
    }
}

#Preview {
    ContentView()
}
