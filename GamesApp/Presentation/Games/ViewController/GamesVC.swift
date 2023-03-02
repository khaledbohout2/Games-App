//
//  GamesVC.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

class GamesVC: BaseVC<GamesView> {
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = UIImage(named: "Recents")
        tabBarItem.title = "Games"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
