//
//  Mission.swift
//  Moonshot
//
//  Created by Gamıd Khalıdov on 10.05.2024.
//

import Foundation

struct Mission: Codable, Identifiable{
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String?
    
    var displayedName: String {
        "Appollo \(id)"
    }
    
    var displayedDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var image: String {
        "apollo\(id)"
    }
}
