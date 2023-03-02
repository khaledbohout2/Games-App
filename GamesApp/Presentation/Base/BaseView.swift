//
//  BaseView.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupAppearance()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func setupAppearance() {
        backgroundColor = .appBackground
    }

    func setupView() {}
}
