//
//  GamesRepository.swift
//  GamesApp
//
//  Created by Khaled Bohout on 02/03/2023.
//

import Foundation

protocol GamesRepositoryDelegate: AnyObject {
    func getLatest(pageNum: String, completionHandler: @escaping(AFResult<BaseModelWithData<[Game]>>) -> Void)
}

class GamesRepository: GamesRepositoryDelegate{

    private var network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }

    func getLatest(pageNum: String, completionHandler: @escaping(AFResult<BaseModelWithData<[Game]>>) -> Void) {
        network.request(GamesNetworkRouter.getLatest(pageNum: pageNum),
                        decodeTo: BaseModelWithData<[Game]>.self,
                        completionHandler: completionHandler)
    }
}
