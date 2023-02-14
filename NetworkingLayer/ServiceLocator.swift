//
//  ServiceLocator.swift
//  NetworkLayer
//
//  Created by Ahmed Nasr on 14/02/2023.
//

import Foundation
import Networking


class ServiceLocator {
 
    /// Alamofire networking
    ///
    private static var _networking: Network = AlamofireNetwork()
    static var networking: Network {
        return _networking
    }
    
    ///Home remote
    ///
    static let homeRemote: HomeRemoteProtocol = HomeRemote(network: networking)
    
}
