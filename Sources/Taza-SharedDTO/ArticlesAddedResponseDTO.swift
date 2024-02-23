import Foundation

public struct ArticlesAddedResponseDTO: Codable {
    public let countOfAddedArticles: Int
    public let countOfTotalArticles: Int
    
    public enum CodingKeys: String, CodingKey {
        case countOfAddedArticles = "count_of_added_articles"
        case countOfTotalArticles = "count_of_total_articles"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.countOfAddedArticles = try container.decode(Int.self, forKey: .countOfAddedArticles)
        self.countOfTotalArticles = try container.decode(Int.self, forKey: .countOfTotalArticles)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.countOfAddedArticles, forKey: .countOfAddedArticles)
        try container.encode(self.countOfTotalArticles, forKey: .countOfTotalArticles)
    }
    
    public init(countOfAddedArticles: Int, countOfTotalArticles: Int) {
        self.countOfAddedArticles = countOfAddedArticles
        self.countOfTotalArticles = countOfTotalArticles
    }
}
