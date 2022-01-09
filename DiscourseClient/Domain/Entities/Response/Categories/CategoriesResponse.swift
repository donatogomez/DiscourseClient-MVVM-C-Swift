//
//  CategoriesResponse.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import Foundation

struct CategoriesResponse: Codable {
    let categoryList: CategoryList

    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

struct CategoryList: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let id: Int
    let name: String
    let color: String
}
