//
//  FavouritesVC.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

class FavouritesVC: BaseVC<FavouritesView> {
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = UIImage(named: "Favorite")
        tabBarItem.title = "Favorites"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
