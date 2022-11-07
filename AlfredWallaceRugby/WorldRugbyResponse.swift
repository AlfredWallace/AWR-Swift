//
//  WorldRugbyDataFetcher.swift
//  AlfredWallaceRugby
//
//  Created by Arthur Falque Pierrotin on 07/11/2022.
//

import SwiftUI

struct WorldRugbyResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case entries, effective
    }
    
    enum EffectiveCodingKeys: String, CodingKey {
        case millis
    }
    
    let dataFreshness: Date
    var teams: [Team]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        teams = try container.decode([Team].self, forKey: .entries)
        
        let effective = try container.nestedContainer(keyedBy: EffectiveCodingKeys.self , forKey: .effective)
        
        dataFreshness = try effective.decode(Date.self, forKey: .millis)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(teams, forKey: .entries)
        
        var effective = container.nestedContainer(keyedBy: EffectiveCodingKeys.self, forKey: .effective)
        
        try effective.encode(dataFreshness, forKey: .millis)
    }
}
