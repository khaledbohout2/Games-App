//
//  GamesView.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

class GamesView: BaseView {

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.tintColor = .appManatee.withAlphaComponent(0.12)
        return searchBar
    }()

    lazy var gamesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(GameCell.self, forCellWithReuseIdentifier: GameCell.identifier)
        return collection
    }()

    lazy var noContentLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .black
        lbl.text = "No game has been searched."
        lbl.isHidden = true
        return lbl
    }()

    override func setupView() {
        super.setupView()
        backgroundColor = .appBackground
        addSubview(searchBar)
        searchBar.anchor(.leading(leadingAnchor),
                         .trailing(trailingAnchor),
                         .top(topAnchor),
                         .height(60))

        addSubview(gamesCollection)
        gamesCollection.anchor(.leading(leadingAnchor),
                              .trailing(trailingAnchor),
                              .top(searchBar.bottomAnchor),
                               .bottom(bottomAnchor))

        addSubview(noContentLbl)
        noContentLbl.anchor(.centerX(centerXAnchor),
                            .top(searchBar.bottomAnchor, constant: 38))
    }

    func setDelegates(_ delegate: Any) {
        gamesCollection.delegate = delegate as? UICollectionViewDelegate
        gamesCollection.dataSource = delegate as? UICollectionViewDataSource
        searchBar.delegate = delegate as? UISearchBarDelegate
    }

}
