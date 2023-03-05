//
//  Game.swift
//  GamesApp
//
//  Created by Khaled Bohout on 03/03/2023.
//

import CoreData
// MARK: - Game
class Game: NSManagedObject, Codable {
    @NSManaged var name: String?
    @NSManaged var backgroundImage: String?
    @NSManaged var metacritic: NSNumber?
    @NSManaged var genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case name
        case backgroundImage = "background_image"
        case metacritic
        case genres
    }

//    var dictionaryValue: [String: Any] {
//        [
//            "name": name ?? "",
//            "backgroundImage": backgroundImage ?? "",
//            "metacritic": metacritic ?? "",
//            "genres": genres ?? [Genre]()
//        ]
//    }

    // MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Game", in: managedObjectContext) else {
            fatalError("Failed to decode Game")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
        self.metacritic = try container.decodeIfPresent(Int.self, forKey: .metacritic) as? NSNumber
        self.genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
    }

    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(backgroundImage, forKey: .backgroundImage)
        try container.encode(metacritic as? Int, forKey: .metacritic)
        try container.encode(genres, forKey: .genres)
    }

}

// MARK: - Genre
class Genre: NSManagedObject, Codable {
    @NSManaged var name: String?

    enum CodingKeys: String, CodingKey {
        case name
    }
    // MARK: - Decodable
    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Genre", in: managedObjectContext) else {
            fatalError("Failed to decode Genre")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }

}

public extension CodingUserInfoKey {
    // Helper property to retrieve the context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

