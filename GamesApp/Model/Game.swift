//
//  Game.swift
//  GamesApp
//
//  Created by Khaled Bohout on 03/03/2023.
//

import Foundation
// MARK: - Game
struct Game: Codable {
    var name: String?
    var backgroundImage: String?
    var metacritic: Int?
    let genres: [Genre]?

    enum CodingKeys: String, CodingKey {
        case name
        case backgroundImage = "background_image"
        case metacritic
        case genres
    }
}

// MARK: - Genre
struct Genre: Codable {
    var name: String?
}
