//
//  GameCell+ViewDelegate.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import Foundation

protocol GameCellDelegate: AnyObject {
    func displayTitle(title: String)
    func displayImage(image: String)
    func displayMetacritic(metacritic: String)
    func displayGenre(genre: String)
}

extension GameCell: GameCellDelegate {
    func displayTitle(title: String) {
        titleLbl.text = title
    }

    func displayImage(image: String) {
        gameImage.load(with: image)
    }

    func displayMetacritic(metacritic: String) {
        metacriticValueLbl.text = metacritic
    }

    func displayGenre(genre: String) {
        categoryLbl.text = genre
    }
}
