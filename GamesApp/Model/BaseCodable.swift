//
//  BaseCodable.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import Foundation

protocol BaseCodable: Codable {
    var error: String? { get set }
    var count: Int? { get set}
}

struct BaseModel: BaseCodable {
    var error: String?
    var count: Int?
}

struct BaseModelWithData<T: Codable>: BaseCodable {
    var error: String?
    var results: T?
    var count: Int?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        error = try? container.decode(String.self, forKey: .error)
        results = try? container.decode(T.self, forKey: .results)
        count = try? container.decode(Int.self, forKey: .count)
    }

    init(error: String?, results: T, count: Int?) {
        self.error = error
        self.count = count
        self.results = results
    }
}
