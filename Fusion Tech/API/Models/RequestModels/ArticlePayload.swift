//
//  ArticlePayload.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 27.01.2022.
//

import Foundation

// MARK: - Info for create Article
struct ArticlePayload: Codable {
    let link: String
    let tags: [Int]
}
