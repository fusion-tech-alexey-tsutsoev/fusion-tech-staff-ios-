//
//  RequestModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.01.2022.
//

import Foundation

// MARK: - RequestResponseData
struct RequestResponseData: Codable {
    let data: [RequestInfo]
}

// MARK: - RequestInfo
struct RequestInfo: Codable, Identifiable {
    let id: Int
    let title: String
    let type: RequestTypes
    let dateFrom: String?
    let dateTo: String?
    let comment: String
    let status: RequestStatusTypes
    let restDaysNumber: Int
    let createdAt, updatedAt: String
    let updatedBy: Int?
    let user: [UserInRequest]
    let dates: [String]?
    let deniedComment: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, type, dateFrom, dateTo, comment, status, deniedComment, dates
        case restDaysNumber = "rest_days_number"
        case createdAt, updatedAt
        case updatedBy = "updated_by"
        case user
    }
}

// MARK: - UserInRequest
struct UserInRequest: Codable {
    let avatar, avatarThumbnail: String
    let id: Int
    let firstName, firstNameRu, lastName, lastNameRu: String
    let education, educationRu, login, info: String
    let phone, email, role, techRole: String
    let status, doB, slackName, slackConversationalID: String
    let repo: [String]
    let isDev: Bool
    let workingFrom, additionalContactName, additionalContactType, additionalContactPhone: String?
    let mentorID: Int?
    let createdAt, updatedAt: String
    let requestUser: RequestUser
    
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
        case requestUser = "request_user"
    }
}

// MARK: - RequestUser
struct RequestUser: Codable {
    let userID, requestID: Int
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case requestID = "request_id"
        case createdAt, updatedAt
    }
}

// MARK: - RequestTypes
enum RequestTypes: String, Codable {
    case dayOff = "dayOff"
    case technical = "technical"
    case documents = "documents"
    case common = "common"
    case vacation = "vacation"
    case medical = "medical"
}

// MARK: - RequestStatusTypes
enum RequestStatusTypes: String, Codable {
    case wait = "wait"
    case completed = "completed"
    case denied = "denied"
    case inProgress = "inProgress"
    case accept = "accept"
    
    var statusRu: String {
        switch self {
        case .accept:
            return "Ожидает рассмотрения"
        case .inProgress:
            return "Выполняется"
        case .completed:
            return "Выполнена"
        case .denied:
            return "Отклонена"
        case .wait:
            return "Ожидает рассмотрения"
        }
    }
}
