//
//  Request.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 28.12.2021.
//

import Foundation

// MARK: - Request
struct Request: Encodable {
    let type: String
    let comment: String
    let title: String
    let dateFrom: Date
    let dateTo: Date
}
