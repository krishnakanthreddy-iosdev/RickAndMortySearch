//
//  DataUtils.swift
//  RickyAndMortySearch
//
//  Created by Krishna Kanth Reddy Podduturi on 4/8/25.
//

import Foundation

enum DataUtils {
    
    /// Converts ISO8601 date string into a formatted string like "Apr 8, 2025"
    static func formatDate(from isoString: String) -> String? {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: isoString) else {
            return nil
        }
        
        return DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
    }
}
