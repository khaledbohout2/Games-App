//
//  BaseRouter.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import UIKit

class BaseRouter {
    class func startHome() -> UIViewController {
            let tabBarVc = MainTabBar()
            let gamesVC = GamesVCRouter.create()
            let favouritesVC = FavouritesVCRouter.create()

            tabBarVc.setViewControllers([gamesVC.toNavigation(),
                                         favouritesVC.toNavigation()],
                                        animated: false)
            return tabBarVc
    }

}
