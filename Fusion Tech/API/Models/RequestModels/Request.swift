//
//  Request.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 28.12.2021.
//

import Foundation
import Alamofire

// MARK: - Request
struct Request: Encodable {
    let type: String
    let comment: String
    let title: String
    let dateFrom: Date
    let dateTo: Date
    
    // MARK: - decode to JSON
    func toJSON() -> Parameters {
        return ["type": type, "comment": comment, "title": title, "dateFrom": dateFrom.formatted(.iso8601), "dateTo": dateTo.formatted(.iso8601)]
    }
}
