//
//  UIViewController+loading.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import NVActivityIndicatorView
import UIKit

extension UIViewController: NVActivityIndicatorViewable {

    func startLoading(message: String? = nil) {
        NVActivityIndicatorView.DEFAULT_COLOR = .blue
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = .black.withAlphaComponent(0.2)
        NVActivityIndicatorView.DEFAULT_TEXT_COLOR = .black
        NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE_FONT = .systemFont(ofSize: 14)
        startAnimating(message: message, type: NVActivityIndicatorType.ballScaleMultiple)
    }

    func setLoadingMessage(message: String) {
        NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
    }

    func stopLoading() {
        stopAnimating()
    }

}
