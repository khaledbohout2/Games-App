//
//  GamesVC+ViewDelegate.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import Foundation

protocol GamesVCViewDelegate: BaseViewProtocol {
    var presenter: GamesVCPresenterDelegate! { get set }
    func fetchingDataSuccess(success: Bool)
}

extension GamesVC: GamesVCViewDelegate {
    func fetchingDataSuccess(success: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.gamesCollection.reloadData()
        }
        guard !success else {return}
        mainView.noContentLbl.isHidden = false
    }
}
