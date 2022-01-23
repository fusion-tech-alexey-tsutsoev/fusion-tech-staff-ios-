//
//  DataForPreview.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.12.2021.
//

import Foundation

let MOCK_MEMBER = TeamMember(avatar: nil, avatarThumbnail: nil, id: 1, firstName: "Alex", firstNameRu: "Алексей", lastName: "Tsutsoev", lastNameRu: "Цуцоев", education: nil, educationRu: nil, login: "alex", info: nil, phone: "123123", email: "alex@alex.ru", role: .user, techRole: "tech lead", status: "active", doB: nil, slackName: nil, slackConversationalID: nil, slackConversationalCRMID: nil, repo: nil, isDev: true, workingFrom: nil, additionalContactName: nil, additionalContactType: nil, additionalContactPhone: nil, mentorID: nil, createdAt: "no", updatedAt: "no")

let MOCK_TASK = CompanyTask(id: 1, title: "Test", bodyDescription: "Test decr", subscription: [1, 2], comment: "bla-bla", taskInColumn: 2, lidCompany: "Apple", lidContactName: "Tim", lidEmail: "imistersin@gmail.com", lidSkype: "raz", lidPhone: "8-800-35-55-35", lidLocation: "London", lidTimeZone: "0", additionalInfoField: ["something"], additionalInfoData: ["raz-raz"], budget: "three hundred bucks", proposalLink: "https://staff.demo.fusion-tech.pro", projectFolderPath: "123", technologies: ["swift"], archive: false, proposal: false, contract: true, eventDatetime: nil, eventDescription: nil, rejectReasonComment: nil, rejectReasonDate: nil, jobLink: nil, stageTs: nil, invite: true, hot: true, projectStartDate: "2021-03-05T00:00:00.000Z", projectEndDate: "2021-04-11T00:00:00.000Z", createdAt: "2021-02-24T11:25:51.189Z", updatedAt: "2021-06-23T17:31:26.506Z", rejectReasonID: nil)
