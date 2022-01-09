//
//  UserDetailRequest.swift
//  DiscourseClient
//
//  Created by Donato Gomez on 7/1/22.
//

import Foundation

struct UserDetailRequest: APIRequest {
    typealias Response = UserDetailResponse
    
    let userName: String
    
    init(userName: String) {
        self.userName = userName
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/users/\(userName).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
