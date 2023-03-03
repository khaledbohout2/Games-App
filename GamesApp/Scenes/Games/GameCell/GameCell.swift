//
//  GameCell.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

class GameCell: UICollectionViewCell {

    lazy var gameImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()

    lazy var categoryLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13)
        lbl.textColor = .appSecondaryText
        lbl.numberOfLines = 0
        return lbl
    }()

    lazy var metacriticLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = .black
        lbl.text = "metacritic:"
        return lbl
    }()

    lazy var metacriticValueLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .red
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        setupLayOut()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayOut() {

        contentView.addSubview(gameImage)
        gameImage.anchor(.leading(contentView.leadingAnchor, constant: 16),
                         .top(contentView.topAnchor, constant: 16),
                         .bottom(contentView.bottomAnchor, constant: 16))
        NSLayoutConstraint.activate([
            gameImage.widthAnchor.constraint(equalTo: gameImage.heightAnchor, multiplier: 1.15/1)
        ])

        contentView.addSubview(titleLbl)
        titleLbl.anchor(.leading(gameImage.trailingAnchor, constant: 16),
                        .top(gameImage.topAnchor),
                        .trailing(contentView.trailingAnchor, constant: 16))

        contentView.addSubview(categoryLbl)
        categoryLbl.anchor(.leading(titleLbl.leadingAnchor),
                           .trailing(titleLbl.trailingAnchor),
                           .bottom(gameImage.bottomAnchor))

        contentView.addSubview(metacriticLbl)
        metacriticLbl.anchor(.leading(titleLbl.leadingAnchor),
                             .bottom(categoryLbl.topAnchor, constant: 8))

        contentView.addSubview(metacriticValueLbl)
        metacriticValueLbl.anchor(.leading(metacriticLbl.trailingAnchor),
                                  .centerY(metacriticLbl.centerYAnchor),
                                  .trailing(titleLbl.trailingAnchor))

    }
}
