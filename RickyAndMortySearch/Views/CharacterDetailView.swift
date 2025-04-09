//
//  CharacterDetailView.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import SwiftUI
import UIKit

struct CharacterDetailView: View {
    let character: Character
    @State private var isSharing = false
    
    private var shareText: String {
        var text = """
        Name: \(character.name)
        Species: \(character.species)
        Status: \(character.status)
        Origin: \(character.origin.name)
        """
        if !character.type.isEmpty {
            text += "\nType: \(character.type)"
        }
        return text
    }
    
    private var characterImageURL: URL? {
        URL(string: character.image)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Character image with fade-in animation
                AsyncImage(url: characterImageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                            .transition(.opacity)
                            .accessibilityLabel("\(character.name)'s profile image")
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(height: 200)
                            .accessibilityLabel("Image failed to load")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                // Character info
                VStack(alignment: .leading, spacing: 8) {
                    Text(character.name)
                        .font(.largeTitle)
                        .bold()
                        .accessibilityAddTraits(.isHeader)
                    
                    detailRow("Species", character.species)
                    detailRow("Status", character.status)
                    detailRow("Origin", character.origin.name)
                    
                    if !character.type.isEmpty {
                        detailRow("Type", character.type)
                    }
                    
                    if let createdDate = ISO8601DateFormatter().date(from: character.created) {
                        let formattedDate = DateFormatter.localizedString(from: createdDate, dateStyle: .medium, timeStyle: .none)
                        detailRow("Created", formattedDate)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isSharing = true
                } label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $isSharing) {
            ShareSheet(activityItems: [shareText, characterImageURL as Any].compactMap { $0 })
        }
    }
    
    // MARK: - Reusable Detail Row
    @ViewBuilder
    private func detailRow(_ label: String, _ value: String) -> some View {
        HStack(alignment: .top) {
            Text("\(label):")
                .bold()
                .foregroundColor(.primary)
            Spacer(minLength: 8)
            Text(value)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
        }
        .font(.body)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(label): \(value)")
    }
}

// MARK: - UIKit Share Sheet
private struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
