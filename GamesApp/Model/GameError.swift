//
//  GameError.swift
//  GamesApp
//
//  Created by Khaled Bohout on 04/03/2023.
//

import Foundation

enum GameError: Error {
    case wrongDataFormat(error: Error)
    case missingData
    case creationError
    case batchInsertError
    case batchDeleteError
    case persistentHistoryChangeError
    case unexpectedError(error: Error)
}
