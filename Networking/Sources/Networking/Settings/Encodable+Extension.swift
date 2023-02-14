//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 14/02/2023.
//

import Foundation


//MARK: - for convert model to Dictionary (parameters) -
//
 extension Encodable {
     func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
