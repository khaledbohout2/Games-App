//
//  GamesNetworkRouter.swift
//  GamesApp
//
//  Created by Khaled Bohout on 03/03/2023.
//

import Alamofire
import Foundation

enum GamesNetworkRouter: URLRequestConvertible {

    case getLatest(pageNum: String, searchText: String?)

    var method: HTTPMethod {
        switch self {
        case .getLatest:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getLatest(let pageNum, let searchText):
            return ["page_size": "10", "page": pageNum, "key": Constants.apiKey, "search": searchText ?? ""]
        }
    }

    var url: URL {
        return URL(string: "\(Constants.baseUrl)")!
            .appendingPathComponent(path)
    }
    var path: String {
        switch self {
        case .getLatest:
            return "games"
        }
    }

    var encoding: ParameterEncoding {
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
