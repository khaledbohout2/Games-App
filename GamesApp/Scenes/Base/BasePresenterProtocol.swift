//
//  BasePresenterProtocol.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import Foundation

protocol BasePresenterProtocol: AnyObject {
    func viewDidLoad()
    func handleRequestResponse<U: BaseCodable>(_ result: AFResult<U>,
                                               inView view: BaseViewProtocol?,
                                               withRouter router: BaseRouter?,
                                               hideLoading: Bool?) -> U?
}

extension BasePresenterProtocol {

    func handleRequestResponse<U: BaseCodable>(_ result: AFResult<U>,
                                               inView view: BaseViewProtocol?,
                                               withRouter router: BaseRouter?,
                                               hideLoading: Bool? = true) -> U? {
        if hideLoading == true { view?.stopLoading() }
        switch result {
        case .success(let data):
            if data.error == nil {
                return data
            } else if let error = data.error {
                view?.showSelfDismissingAlert(error)
                return nil
            } else {
                view?.showSelfDismissingAlert("Error")
                return nil
            }
        case .failure(let error):
            view?.showSelfDismissingAlert(error.localizedDescription)
            return nil
        }
    }

}
