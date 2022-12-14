//
//  Team.swift
//  AlfredWallaceRugby
//
//  Created by Arthur Falque Pierrotin on 07/11/2022.
//

import SwiftUI

class SharedTeams: ObservableObject {
    @Published var data = [Team]()
}

struct Team: Codable {
    enum CodingKeys: CodingKey {
        case team, pts, pos
    }
    
    enum TeamCodingKeys: CodingKey {
        case id, name, abbreviation
    }
    
    let id: Int
    let name: String
    let abbreviation: String
    
    var initialPoints: Double
    var position: Int
    
    var points = [Double]()
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        initialPoints = try container.decode(Double.self, forKey: .pts)
        position = try container.decode(Int.self, forKey: .pos)
        
        let team = try container.nestedContainer(keyedBy: TeamCodingKeys.self, forKey: .team)
        
        id = try team.decode(Int.self, forKey: .id)
        name = try team.decode(String.self, forKey: .name)
        abbreviation = try team.decode(String.self, forKey: .abbreviation)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(initialPoints, forKey: .pts)
        try container.encode(position, forKey: .pos)
        
        var team = container.nestedContainer(keyedBy: TeamCodingKeys.self, forKey: .team)
        
        try team.encode(id, forKey: .id)
        try team.encode(name, forKey: .name)
        try team.encode(abbreviation, forKey: .abbreviation)
    }
}
