//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation


// MARK: - shopsBody
public struct shopsBody: Codable {
    public let lat, lon: String?
    public let category_id: Int
    
    enum CodingKeys: String, CodingKey {
        case lat, lon
        case category_id
    }
    
    public init(lat: String?, lon: String?, category_id: Int) {
        self.lat = lat
        self.lon = lon
        self.category_id = category_id
    }
}

public typealias FamilyHomeModel = [SingleShopElement]


// MARK: - SingleShopElement
public struct SingleShopElement: Codable {
    public let id, categoryID: Int?
    
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
    }
}
