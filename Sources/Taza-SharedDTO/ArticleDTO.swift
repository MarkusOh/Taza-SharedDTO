import Foundation

public struct ArticleDTO: Codable, Identifiable {
    public let id: UUID
    public let title: String
    public let content: String
    public let author: String
    public let publishedDate: Date
    public let sourceURL: URL?
    public let addedDate: Date
    
    public enum CodingKeys: String, CodingKey {
        case id, title, content, author
        case publishedDate = "published_date"
        case sourceURL = "source_url"
        case addedDate = "added_date"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.content = try container.decode(String.self, forKey: .content)
        self.author = try container.decode(String.self, forKey: .author)
        self.publishedDate = try container.decode(Date.self, forKey: .publishedDate)
        self.sourceURL = try container.decodeIfPresent(URL.self, forKey: .sourceURL)
        self.addedDate = try container.decode(Date.self, forKey: .addedDate)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.author, forKey: .author)
        try container.encode(self.publishedDate, forKey: .publishedDate)
        try container.encodeIfPresent(self.sourceURL, forKey: .sourceURL)
        try container.encode(self.addedDate, forKey: .addedDate)
    }
    
    public init(
        id: UUID,
        title: String,
        content: String,
        author: String,
        publishedDate: Date,
        sourceURL: URL?,
        addedDate: Date
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.author = author
        self.publishedDate = publishedDate
        self.sourceURL = sourceURL
        self.addedDate = addedDate
    }
}
