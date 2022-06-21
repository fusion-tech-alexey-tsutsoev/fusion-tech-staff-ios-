//
//  CRMResponse.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.05.2022.
//

import Foundation


// MARK: - CRMData
struct CRMData: Codable {
    let data: CRMResponse
}

// MARK: - CRMResponse
struct CRMResponse: Codable {
    let studentTasks: [StudentTask]
    let crmContracts, crmHotLeads: [CRM]
    let requests: [RequestTask]
    let devIDS, studentIDS: [Int]
    let users: [BodyUser]

    enum CodingKeys: String, CodingKey {
        case studentTasks, crmContracts, crmHotLeads, requests
        case devIDS = "devIds"
        case studentIDS = "studentIds"
        case users
    }
}

// MARK: - CRM
struct CRM: Codable, Identifiable {
    let id: Int
    let title, crmDescription: String
    let subscription: [Int]
    let comment: String
    let taskInColumn: Int
    let lidCompany, lidContactName, lidEmail: String
    let lidSkype: String
    let lidPhone: String
    let lidLocation, lidTimeZone: String
    let additionalInfoField, additionalInfoData: [String]
    let budget: String
    let proposalLink: String
    let projectFolderPath: String
    let technologies: [String]
    let archive, proposal, contract: Bool
    let eventDatetime, eventDescription: String?
    let rejectReasonComment: String
    let rejectReasonDate: String?
    let jobLink: String
    let stageTs: String
    let invite, hot: Bool
    let projectStartDate, projectEndDate: String?
    let dedicatedSeller: Int?
    let createdAt, updatedAt: String
    let rejectReasonID: Int?

    enum CodingKeys: String, CodingKey {
        case id, title
        case crmDescription = "description"
        case subscription, comment
        case taskInColumn = "task_in_column"
        case lidCompany = "lid_company"
        case lidContactName = "lid_contact_name"
        case lidEmail = "lid_email"
        case lidSkype = "lid_skype"
        case lidPhone = "lid_phone"
        case lidLocation = "lid_location"
        case lidTimeZone = "lid_time_zone"
        case additionalInfoField = "additional_info_field"
        case additionalInfoData = "additional_info_data"
        case budget
        case proposalLink = "proposal_link"
        case projectFolderPath = "project_folder_path"
        case technologies, archive, proposal, contract
        case eventDatetime = "event_datetime"
        case eventDescription = "event_description"
        case rejectReasonComment = "reject_reason_comment"
        case rejectReasonDate = "reject_reason_date"
        case jobLink = "job_link"
        case stageTs = "stage_ts"
        case invite, hot
        case projectStartDate = "project_start_date"
        case projectEndDate = "project_end_date"
        case dedicatedSeller = "dedicated_seller"
        case createdAt, updatedAt
        case rejectReasonID = "reject_reason_id"
    }
}

// MARK: - RequestTask
struct RequestTask: Codable, Identifiable {
    let id: Int
    let title: String
    let type: TypeEnum
    let dateFrom, dateTo: String
    let dates: JSONNull?
    let comment: String
    let status: RequestStatus
    let deniedComment: JSONNull?
    let restDaysNumber: Int
    let createdAt, updatedAt: String
    let updatedBy: Int
    let user: [RequestUserTask]

    enum CodingKeys: String, CodingKey {
        case id, title, type, dateFrom, dateTo, dates, comment, status, deniedComment
        case restDaysNumber = "rest_days_number"
        case createdAt, updatedAt
        case updatedBy = "updated_by"
        case user
    }
}

enum RequestStatus: String, Codable {
    case completed = "completed"
}

enum TypeEnum: String, Codable {
    case dayOff = "dayOff"
    case medical = "medical"
    case vacation = "vacation"
}

// MARK: - RequestUserTask
struct RequestUserTask: Codable {
    let id: Int
}

// MARK: - StudentTask
struct StudentTask: Codable {
    let userID: Int
    let taskJobs: [TaskJob]

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case taskJobs
    }
}

// MARK: - TaskJob
struct TaskJob: Codable {
    let id: Int
    let title, taskJobDescription: String
    let timeLimits: Int
    let level, createdAt, updatedAt: String
    let planTaskJob: PlanTaskJob

    enum CodingKeys: String, CodingKey {
        case id, title
        case taskJobDescription = "description"
        case timeLimits = "time_limits"
        case level, createdAt, updatedAt
        case planTaskJob = "plan_taskJob"
    }
}

// MARK: - PlanTaskJob
struct PlanTaskJob: Codable {
    let id, planID, taskJobID: Int
    let status: JSONNull?
    let startTask: String
    let finishTask: String?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case planID = "plan_id"
        case taskJobID = "taskJob_id"
        case status, startTask, finishTask, createdAt, updatedAt
    }
}

// MARK: - BodyUser
struct BodyUser: Codable {
    let avatar, avatarThumbnail: String?
    let id: Int
    let firstName: String
    let firstNameRu: String?
    let lastName: String
    let lastNameRu, education, educationRu: String?
    let login: String
    let info: Info
    let phone, email: String
    let role: Role
    let techRole: String?
    let status: UserStatus
    let doB: String
    let slackName, slackConversationalID, slackConversationalCRMID: String?
    let repo: [String]
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

enum Info: String, Codable {
    case cbdoЗаместительГенеральногоДиректораПоРазвитию = "CBDO \nЗаместитель генерального директора по развитию"
    case empty = ""
    case info = " "
    case mostlyJS = "mostly js"
    case projectManager = "Project Manager"
    case менеджерПоПродажам = "Менеджер по продажам"
    case мыВсеУчилисьПонемногуЧемуНибудьИКакНибудь = "Мы все учились понемногу. Чему-нибудь и как-нибудь"
    case разработчик = "Разработчик"
}

enum Role: String, Codable {
    case admin = "admin"
    case mentor = "mentor"
    case officeManager = "officeManager"
    case sales = "sales"
    case student = "student"
    case user = "user"
}

enum UserStatus: String, Codable {
    case active = "active"
}
