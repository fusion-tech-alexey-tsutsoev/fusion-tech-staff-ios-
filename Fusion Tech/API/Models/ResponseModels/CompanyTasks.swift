//
//  CompanyTasks.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.01.2022.
//

import Foundation

// MARK: - CompanyTask
struct CompanyTask: Codable, Identifiable {
    let id: Int
    let title: String
    let bodyDescription: String
    let subscription: [Int]
    let comment: String
    let taskInColumn: Int
    let lidCompany: String
    let lidContactName, lidEmail, lidSkype, lidPhone: String
    let lidLocation, lidTimeZone: String
    let additionalInfoField: [String]
    let additionalInfoData: [String]
    let budget: String
    let proposalLink, projectFolderPath: String
    let technologies: [String]
    let archive, proposal, contract: Bool
    let eventDatetime, eventDescription, rejectReasonComment, rejectReasonDate: String?
    let jobLink: String?
    let stageTs: String?
    let invite, hot: Bool
    let projectStartDate, projectEndDate: String?
    let createdAt, updatedAt: String
    let rejectReasonID: Int?

    enum CodingKeys: String, CodingKey {
        case id, title
        case bodyDescription = "description"
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
        case createdAt, updatedAt
        case rejectReasonID = "reject_reason_id"
    }
}

typealias TaskResponse = [CompanyTask]
