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
    let launchDate: String?
    let crew: [CrewRole]
    let descreption: String?
    
    var displayedName: String {
        "Appollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
}
