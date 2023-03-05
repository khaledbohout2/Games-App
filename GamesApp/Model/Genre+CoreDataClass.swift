//
//  Genre+CoreDataClass.swift
//  GamesApp
//
//  Created by Khaled Bohout on 06/03/2023.
//

import Foundation
import CoreData


public class Genre: NSManagedObject {
    // MARK: - Decodable
    required convenience public init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Genre", in: managedObjectContext) else {
            fatalError("Failed to decode Genre")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }

}
