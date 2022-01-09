//
//  TopicDetailRequest.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import Foundation

struct TopicDetailRequest: APIRequest {
    typealias Response = TopicDetailResponse
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: Method {
        .GET
    }
    
    var path: String {
        "/t/\(id).json"
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
