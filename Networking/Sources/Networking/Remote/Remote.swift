//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation
import Alamofire


public class Remote {
    
    /// Networking Wrapper: Dependency Injection Mechanism, useful for Unit Testing purposes.
    ///
    let network: Network

    /// Designated Initializer.
    ///
    /// - Parameters:
    ///     - credentials: Credentials to be used in order to authenticate every request.
    ///     - network: Network Wrapper, in charge of actually enqueueing a given network request.
    ///
    public init(network: Network) {
        self.network = network
    }
    
    /// Enqueues the specified Network Request.
    ///
    /// - Parameters:
    ///     - request: Request that should be performed.
    ///     - decoder: Decoder entity that will be used to attempt to decode the Backend's Response.
    ///     - completion: Closure to be executed upon completion.
    ///
    func enqueue<D: Decodable>(_ request: URLRequestConvertible,
                               decoder: JSONDecoder = JSONDecoder(),
                               completion: @escaping (Result<D, Error>) -> Void) {
        network.responseData(for: request) { result in
            switch result {
            case let .success(data):
                do {
                    let decoded = try decoder.decode(D.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(failure):
                completion(.failure(failure))
            }
        }
    }
    
    
    /// upload the specified Network Request.
    ///
    /// - Parameters:
    ///     - request: Request that should be performed.
    ///     - images: Make request with images using multipartFormData
    ///     - decoder: Decoder entity that will be used to attempt to decode the Backend's Response.
    ///     - completion: Closure to be executed upon completion.
    ///
    func upload<D: Decodable>(_ request: URLRequestConvertible,
                images: [ImageRequest],
                decoder: JSONDecoder = JSONDecoder(),
                completion: @escaping (Result<D, Error>) -> Void) {
        
        network.upload(for: request, images: images) { result in
            switch result {
            case let .success(data):
                do {
                    let decoded = try decoder.decode(D.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(failure):
                completion(.failure(failure))
            }
        }
    }
}
