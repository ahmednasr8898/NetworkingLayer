//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation


public typealias Users = [UserElement]

// MARK: - UserElement
public struct UserElement: Codable {
    public let id: Int
    public let name, username, email: String
    public let address: Address
    public let phone, website: String
}

// MARK: - Address
public struct Address: Codable {
    public let street, suite, city, zipcode: String
}

// MARK: - UserProfileBody
public struct UserProfileBody: Encodable {
    public let f_name, l_name, email, phone: String?
    
    enum CodingKeys: String, CodingKey {
        case f_name, l_name, email, phone
    }
    
    public init(f_name: String?, l_name: String?, email: String?, phone: String?) {
        self.f_name = f_name
        self.l_name = l_name
        self.email = email
        self.phone = phone
    }
}



// MARK: - UserModel
public struct UserModel: Codable {
    public let fName, lName, email, notificationToken: String?
    public let updatedAt, createdAt: String?
    public let id: Int?
    public let isActive, activationCode, type, token: String?
    public let image, phone, isDriver: String?
    public let avarageReviews: Float?
    public let requestCounts: Int?

    enum CodingKeys: String, CodingKey {
        case fName = "f_name"
        case lName = "l_name"
        case email
        case notificationToken = "notification_token"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
        case isActive = "is_active"
        case activationCode = "activation_code"
        case type, token, image, phone
        case isDriver = "is_driver"
        case avarageReviews, requestCounts
    }
}
