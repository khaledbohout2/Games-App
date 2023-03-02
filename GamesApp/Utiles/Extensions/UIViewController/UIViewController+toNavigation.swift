//
//  UIViewController+toNavigation.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import UIKit

extension UIViewController {
    func toNavigation() -> UINavigationController {
        let nav =  UINavigationController(rootViewController: self)
        return nav
    }
}
