//
//  URLRequestConvertible.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import Alamofire
import Foundation

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}
