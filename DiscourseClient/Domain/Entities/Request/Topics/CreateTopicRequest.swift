//
//  CreateTopicRequest.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import Foundation

struct CreateTopicRequest: APIRequest {
    typealias Response = CreateTopicResponse
    
    let title: String
    let raw: String
    let createAt: String

    init(title: String, raw: String, createAt: String) {
        self.title = title
        self.raw = raw
        self.createAt = createAt
    }
    
    var method: Method {
        .POST
    }
    
    var path: String {
      "/posts.json"
    }
    
    var parameters: [String : String] {
        [:]
    }
    
    var body: [String : Any] {
        ["title": title,
         "raw": raw,
         "create_at": createAt
        ]
    }
    
    var headers: [String : String] {
        [:]
    }
    
    
}
