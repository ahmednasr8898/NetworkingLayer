//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation
import Alamofire


struct MyRequest: URLRequestConvertible {
    
    /// HTTP Request Method
    ///
    let method: HTTPMethod

    /// URL Path
    ///
    let path: String

    /// Parameters
    ///
    let parameters: [String: Any]

    /// Designated Initializer.
    ///
    /// - Parameters:
    ///     - method: HTTP Method we should use.
    ///     - path: RPC that should be called.
    ///     - parameters: Collection of Key/Value parameters, to be forwarded to the Jetpack Connected site.
    ///
    init(method: HTTPMethod, path: String, parameters: [String: Any]? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters ?? [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Settings.baseUrl + path)!
        let request = try URLRequest(url: url, method: method, headers: Shared.headers)

        return try encoder.encode(request, with: parameters)
    }
}


// MARK: - Request: Internal -
//
private extension MyRequest {

    /// Returns the Parameters Encoder
    ///
    var encoder: ParameterEncoding {
        return method == .get ? URLEncoding.queryString : URLEncoding.httpBody
    }
}
