//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation
import Alamofire

enum Settings {
    
    ///Base url
    static let baseUrl = "https://dots-erp.com/marsoul/public_html/api/"
}


enum Shared {
    ///Header
    static let headers: HTTPHeaders = [
        "Content-Type": "application/x-www-form-urlencoded",
        "Cache-Control": "no-cache",
        "Authorization": " ",
    ]
}
