//
//  GamesVCRouter.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

class GamesVCRouter: BaseRouter {
    class func create() -> UIViewController {
        let vCont = GamesVC()
        let router = GamesVCRouter()
        let repository = GamesRepository(network: Network())
        let presenter = GamesVCPresenter(view: vCont,
                                         router: router,
                                         repository: repository)
        vCont.presenter = presenter
        return vCont
    }
}
