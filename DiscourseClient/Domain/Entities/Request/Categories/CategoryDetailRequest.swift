//
//  CategoryDetailRequest.swift
//  DiscourseClient
//
//  Created by Donato Gomez on 6/1/22.
//

import Foundation

struct CategoryDetailRequest: APIRequest {
    typealias Response = CategoryDetailResponse
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: Method {
        .GET
    }
    
    var path: String {
        "/c/\(id)/show.json"
    }
    
    var parameters: [String : String] {
        [:]
    }
    
    var body: [String : Any] {
        [:]
    }
    
    var headers: [String : String] {
        [:]
    }
    
}
