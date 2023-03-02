//
//  UIViewController+showAlert.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import UIKit

extension UIViewController {
    func showAlert(title: String? = "",
                   message: String?,
                   selfDismissing: Bool = true,
                   time: TimeInterval = 1) {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)

        alert.title = title
        alert.message = message

        if !selfDismissing {
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        }

        present(alert, animated: true)

        if selfDismissing {
            Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
                timer.invalidate()
                alert.dismiss(animated: true)
            }
        }
    }
}
