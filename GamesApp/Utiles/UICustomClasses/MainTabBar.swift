//
//  MainTabBar.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewConts = viewControllers else { return }
        for viewCont in viewConts {
            viewCont.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
            viewCont
                .tabBarItem
                .setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], for: .normal)
        }
    }
}
