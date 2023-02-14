//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation
import Alamofire


public struct ImageRequest {
    public var imageData: Data?
    public var imageName: String
    
    public init(imageData: Data? = nil, imageName: String) {
        self.imageData = imageData
        self.imageName = imageName
    }
}


public protocol Network {

    /// Executes the specified Network Request. Upon completion, the payload will be sent back to the caller as a Data instance.
    ///
    func responseData(for request: URLRequestConvertible, completion: @escaping (Result<Data, Error>) -> Void)

    
    /// Make request with images using multipartFormData.
    ///
    func upload(for request: URLRequestConvertible, images: [ImageRequest], completion: @escaping (Result<Data, Error>) -> Void)
}

