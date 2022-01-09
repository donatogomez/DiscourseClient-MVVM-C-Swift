//
//  CategoriesRequest.swift
//  DiscourseClient
//
//  Created by Donato Gomez on 6/1/22.
//

import Foundation

struct CategoriesRequest: APIRequest {
    typealias Response = CategoriesResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
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
