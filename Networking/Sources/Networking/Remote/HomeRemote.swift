//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 13/02/2023.
//

import Foundation


public protocol HomeRemoteProtocol {
    func users(completion: @escaping (Result<Users?, Error>) -> Void)
    func shops(body: shopsBody, completion: @escaping (Result<FamilyHomeModel?, Error>) -> Void)
    func albums(userId: Int, completion: @escaping (Result<Albums?, Error>) -> Void)
    func userProfile(body: UserProfileBody, images: [ImageRequest], completion: @escaping (Result<UserModel?, Error>) -> Void)
    func changeAvater(images: [ImageRequest], completion: @escaping (Result<UserModel?, Error>) -> Void)
}


public class HomeRemote: Remote, HomeRemoteProtocol {
    public func users(completion: @escaping (Result<Users?, Error>) -> Void) {
        let request = MyRequest(method: .get, path: "/users")
        enqueue(request, completion: completion)
    }
    
    public func shops(body: shopsBody, completion: @escaping (Result<FamilyHomeModel?, Error>) -> Void) {
        let param = try! body.asDictionary()
        let request = MyRequest(method: .post, path: "shops", parameters: param)
        enqueue(request, completion: completion)
    }
    
    public func albums(userId: Int, completion: @escaping (Result<Albums?, Error>) -> Void) {
        let param = ["userId": userId]
        let request = MyRequest(method: .get, path: "/albums", parameters: param)
        enqueue(request, completion: completion)
    }
    
    public func changeAvater(images: [ImageRequest], completion: @escaping (Result<UserModel?, Error>) -> Void) {
        let request = MyRequest(method: .post, path: "avater")
        upload(request, images: images, completion: completion)
    }
    
    public func userProfile(body: UserProfileBody, images: [ImageRequest], completion: @escaping (Result<UserModel?, Error>) -> Void) {
        let param = try! body.asDictionary()
        let request = MyRequest(method: .post, path: "profile", parameters: param)
        upload(request, images: images, completion: completion)
    }
}

