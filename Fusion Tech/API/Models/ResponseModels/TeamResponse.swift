//
//  UsersResponse.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 21.12.2021.
//

import Foundation

// MARK: - Team
struct Team: Codable {
    let data: [TeamMember]
}

// MARK: - TeamMember
struct TeamMember: Codable, Identifiable {
    let avatar, avatarThumbnail: String?
    let id: Int
    let firstName, firstNameRu, lastName, lastNameRu: String?
    let education, educationRu: String?
    let login: String
    let info: TeamMemberInfo?
    let phone, email: String
    let role: TeamMemberRole
    let techRole: String?
    let status: String
    let doB, slackName, slackConversationalID, slackConversationalCRMID: String?
    let repo: [String]?
    let isDev: Bool
    let workingFrom, additionalContactName, additionalContactType, additionalContactPhone: String?
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

// MARK: - TeamMemberInfo
enum TeamMemberInfo: String, Codable {
    case cbdoЗаместительГенеральногоДиректораПоРазвитию = "CBDO \nЗаместитель генерального директора по развитию"
    case empty = ""
    case info = " "
    case mostlyJS = "mostly js"
    case projectManager = "Project Manager"
    case менеджерПоПродажам = "Менеджер по продажам"
    case мыВсеУчилисьПонемногуЧемуНибудьИКакНибудь = "Мы все учились понемногу. Чему-нибудь и как-нибудь"
    case разработчик = "Разработчик"
}

// MARK: - TeamMemberRole
enum TeamMemberRole: String, Codable {
    case admin = "admin"
    case hr = "hr"
    case mentor = "mentor"
    case officeManager = "officeManager"
    case sales = "sales"
    case student = "student"
    case user = "user"
}
