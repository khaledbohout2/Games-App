//
//  BaseViewProtocol.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    func startLoading(message: String?)
    func stopLoading()
    func showSelfDismissingAlert(_ message: String)
    func setLeftNavTitle(_ title: String)
    func pop()
}

extension BaseViewProtocol where Self: UIViewController {

    func startLoading(message: String? = nil) {
        startLoading(message: message)
    }

    func stopLoading() {
        stopLoading()
    }

    func showSelfDismissingAlert(_ message: String) {
        showAlert(message: message)
    }

    func showSelfDismissingAlert(_ message: String, after time: TimeInterval) {
        showAlert(message: message, time: time)
    }

    func setLeftNavTitle(_ title: String) {
        let label = UILabel()
        label.text = title
        label.textColor = .black
        label.font = .systemFont(ofSize: 22)
        var topParent: UIViewController = self
        while topParent.parent != nil,
              String(describing: type(of: topParent.parent!.self))
                != String(describing: UINavigationController.self) {
            topParent = topParent.parent!
        }
        topParent.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }

    func pop() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
    }

}
