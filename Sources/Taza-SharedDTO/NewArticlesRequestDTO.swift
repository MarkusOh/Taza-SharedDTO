//
//  File.swift
//  
//
//  Created by Seungsub Oh on 2/23/24.
//

import Foundation

public struct NewArticlesRequestDTO: Codable {
    public let lastUpdateDate: Date
    
    public enum CodingKeys: String, CodingKey {
        case lastUpdateDate = "last_update_date"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lastUpdateDate = try container.decode(Date.self, forKey: .lastUpdateDate)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.lastUpdateDate, forKey: .lastUpdateDate)
    }
    
    public init(lastUpdateDate: Date) {
        self.lastUpdateDate = lastUpdateDate
    }
}
