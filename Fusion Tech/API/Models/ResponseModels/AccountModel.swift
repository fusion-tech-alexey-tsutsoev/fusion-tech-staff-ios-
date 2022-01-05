//
//  AccountModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.12.2021.
//

import Foundation

// MARK: - Account
struct Account: Codable {
    let access, refresh: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let avatar, avatarThumbnail: String
    let id: Int
    let firstName, firstNameRu, lastName, lastNameRu: String
    let education, educationRu, login, info: String
    let phone, email, role, techRole: String
    let status, doB, slackName, slackConversationalID: String
    let repo: [String]
    let isDev: Bool
    let workingFrom, additionalContactName, additionalContactType, additionalContactPhone: String
    let mentorID: Int
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case avatar, avatarThumbnail, id, firstName
        case firstNameRu = "firstName_ru"
        case lastName
        case lastNameRu = "lastName_ru"
        case education
        case educationRu = "education_ru"
        case login, info, phone, email, role
        case techRole = "tech_role"
        case status
        case doB = "DoB"
        case slackName = "slack_name"
        case slackConversationalID = "slack_conversational_id"
        case repo, isDev, workingFrom, additionalContactName, additionalContactType, additionalContactPhone
        case mentorID = "mentor_id"
        case createdAt, updatedAt
    }
}
