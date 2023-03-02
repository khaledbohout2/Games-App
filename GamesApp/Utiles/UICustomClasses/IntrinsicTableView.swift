//
//  IntrinsicTableView.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import UIKit

class IntrinsicTableView: UITableView {

    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

}
