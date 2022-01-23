//
//  UpdateUserPayload.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.01.2022.
//

import Foundation

struct UpdateUserPayload: Codable {
    let login, phone, slackName, email: String
    let firstName, firstNameRu, lastName, lastNameRu: String
    let education, educationRu, info, doB: String
    let repo: [String]
    
    enum CodingKeys: String, CodingKey {
        case login, phone
        case slackName = "slack_name"
        case email, firstName
        case firstNameRu = "firstName_ru"
        case lastName
        case lastNameRu = "lastName_ru"
        case education
        case educationRu = "education_ru"
        case info
        case doB = "DoB"
        case repo
    }
}
