//
//  GamesVC+SearchBarDelegate.swift
//  GamesApp
//
//  Created by Khaled Bohout on 03/03/2023.
//

import UIKit

extension GamesVC: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.textDidChange(text: searchText)
    }
}
