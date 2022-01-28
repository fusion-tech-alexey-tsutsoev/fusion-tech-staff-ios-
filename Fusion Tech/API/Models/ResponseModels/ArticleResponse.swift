//
//  ArticleResponse.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import Foundation

// MARK: - Article
struct Article: Codable, Identifiable {
    let id: Int
    let title, bodyDescription: String
    let image: String
    let url: String
    let link: String
    let createdAt, updatedAt: String
    let addedBy: Int
    let tags: [Tag]
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case bodyDescription = "description"
        case image, url, link, createdAt, updatedAt
        case addedBy = "added_by"
        case tags
    }
}

// MARK: - Tag
struct Tag: Codable, Identifiable {
    let id: Int
}

typealias ArticleResponse = [Article]
