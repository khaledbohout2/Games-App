//
//  Network.swift
//  GamesApp
//
//  Created by Khaled Bohout on 01/03/2023.
//

import Alamofire
import Foundation

typealias NetworkCompletion<T> = (AFResult<T>) -> Void
typealias AFResult<T> = Result<T, Error>

protocol NetworkProtocol {
    func request<T>(_ request: URLRequestConvertible,
                    decodeTo type: T.Type,
                    completionHandler: @escaping NetworkCompletion<T>) where T: Codable
    func cancelAllRequests()
}

class Network: RequestInterceptor {

#if DEBUG
    fileprivate let willPrint = true
#else
    fileprivate let willPrint = false
#endif

    fileprivate let networkMiddleware = NetworkMiddleware()

    fileprivate lazy var manager: Session = networkMiddleware.sessionManager

    fileprivate func process<T>(response: AFDataResponse<T>, decodedTo type: T.Type) -> AFResult<T> where T: Codable {
        switch response.result {
        case .success:

            guard let data = response.data else {
                if willPrint { debugPrint("=======DEBUG=NETWORK=============Request has no data") }
                return .failure(NSError.create(description: "Server Error"))
            }

            let decoder = JSONDecoder()
            do {
                let data = try decoder.decode(type, from: data)
                if willPrint {
                    debugPrint("=======DEBUG=NETWORK=============Request DATA")
                    dump(data)
                }
                return .success(data)
            } catch {
                if willPrint {
                    debugPrint("=======DEBUG=NETWORK=============Request DECODING ERROR")
                    debugPrint(error)
                }
                return .failure(NSError.create(description: "Server Error"))
            }

        case .failure(let error):

            if willPrint {
                debugPrint("=======DEBUG=NETWORK=============Request Failure")
                debugPrint(error.localizedDescription)
            }

            if error.localizedDescription.contains("JSON") {
                return .failure(NSError.create(description: "Server Error"))
            }

            return .failure(error)
        }
    }

    func cancelAllRequests() {
        manager.session.getAllTasks { tasks in tasks.forEach { $0.cancel() } }
    }

}

extension Network: NetworkProtocol {
    func request<T>(_ request: URLRequestConvertible,
                    decodeTo type: T.Type,
                    completionHandler: @escaping (AFResult<T>) -> Void) where T: Codable {
        manager.request(request).responseDecodable {[weak self] (response: AFDataResponse<T>) in
            guard let self = self else { return }

            if self.willPrint {
                debugPrint("=======DEBUG=NETWORK=============Request URL")
                debugPrint(response.request?.url?.absoluteString as Any)
                debugPrint("=======DEBUG=NETWORK=============Request RESPONSE")
                debugPrint(response)
            }

            completionHandler(self.process(response: response, decodedTo: type))
        }
    }
}

fileprivate extension NSError {
    class func create(description: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: description])
    }
}
