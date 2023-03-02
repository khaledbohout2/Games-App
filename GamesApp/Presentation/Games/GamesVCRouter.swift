//
//  GamesVCRouter.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

class GamesVCRouter: BaseRouter {
    class func create() -> UIViewController {
        return GamesVC()
    }
}
