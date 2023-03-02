//
//  BaseCodable.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import Foundation

protocol BaseCodable: Codable {
    var error: String? { get set }
}

struct BaseModel: BaseCodable {
    var error: String?
}

struct BaseModelWithData<T: Codable>: BaseCodable {
    var error: String?
    var data: T?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        error = try? container.decode(String.self, forKey: .error)
        data = try? container.decode(T.self, forKey: .data)
    }
}
