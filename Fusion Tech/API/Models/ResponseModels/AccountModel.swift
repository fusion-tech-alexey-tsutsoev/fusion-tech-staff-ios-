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
    let avatar, avatarThumbnail: String?
    let id: Int
    let firstName, firstNameRu, lastName, lastNameRu: String
    let education, educationRu, login, info: String
    let phone, email, role, techRole: String
    let status, doB, slackName, slackConversationalID: String
    let slackConversationalCRMID: String?
    let repo: [String]
    let isDev: Bool
    let workingFrom: String?
    let additionalContactName, additionalContactType, additionalContactPhone: String?
    let mentorID: Int?
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
        case slackConversationalCRMID = "slack_conversational_crm_id"
        case repo, isDev, workingFrom, additionalContactName, additionalContactType, additionalContactPhone
        case mentorID = "mentor_id"
        case createdAt, updatedAt
    }
}


class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
