//
//  TagResponse.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import Foundation

// MARK: - Tag
struct TagInfo: Codable, Identifiable {
    let id: Int
    let title, createdAt, updatedAt: String
}

typealias TagResponse = [TagInfo]
