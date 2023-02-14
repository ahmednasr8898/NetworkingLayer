//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation
import Alamofire


// AlamofireWrapper: Encapsulates all of the Alamofire OP's
///
public class AlamofireNetwork: Network {
    
    public init() {}

    /// Executes the specified Network Request. Upon completion, the payload will be sent back to the caller as a Data instance.
    ///
    public func responseData(for request: Alamofire.URLRequestConvertible, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(request).responseData { response in
            completion(response.result.toSwiftResult())
        }
    }
    
    
    /// Make request with images using multipartFormData.
    ///
    public func upload(for request: Alamofire.URLRequestConvertible, images: [ImageRequest], completion: @escaping (Result<Data, Error>) -> Void) {
        AF.upload(multipartFormData: { (multipartFormData) in
            for image in images {
                multipartFormData.append(image.imageData ?? Data(), withName: "\(image.imageName)", fileName: "\(image.imageName).jpeg", mimeType: "\(image.imageName)/jpeg")
            }
        }, with: request)
        .responseData { response in
            completion(response.result.toSwiftResult())
        }
    }
}


// MARK: - Swift.Result Conversion -
//
private extension Result where Failure == AFError {
    /// Convert this `Alamofire.Result` to a `Swift.Result`.
    ///
    func toSwiftResult() -> Swift.Result<Success, Error> {
        switch self {
        case let .success(value):
            return .success(value)
        case let .failure(error):
            return .failure(error)
        }
    }
}
