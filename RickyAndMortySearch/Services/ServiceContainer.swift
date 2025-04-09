//
//  ServiceContainer.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import Foundation

/// Holds app-wide service instances.
/// Used for basic dependency injection.
final class ServiceContainer {
    static let shared = ServiceContainer()
    
    let apiService: APIService
    
    private init() {
        self.apiService = APIService()
    }
}
