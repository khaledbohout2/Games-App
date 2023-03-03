//
//  UIViewController+loading.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import UIKit

extension UIViewController {
    var activityView: UIActivityIndicatorView {
        let activityView = UIActivityIndicatorView(style: .whiteLarge)
        return activityView
    }

    func startLoading(message: String? = nil) {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }

    func stopLoading() {
        activityView.stopAnimating()
    }

}
