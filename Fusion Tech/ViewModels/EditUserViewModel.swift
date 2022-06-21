//
//  EditUserViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 13.01.2022.
//

import SwiftUI

// MARK: - Data for Editing user
class EditUserViewModel: ObservableObject {
    @Published var login = ""
    @Published var email = ""
    @Published var slackName = ""
    @Published var phoneNumber = ""
    @Published var firstNameRu = ""
    @Published var firstName = ""
    @Published var lastNameRu = ""
    @Published var lastName = ""
    @Published var dob = Date()
    @Published var repos = Array<String>()
    @Published var education = ""
    @Published var info = ""
    
    func initUser(userInfo: User?) {
        login = userInfo?.login ?? ""
        email = userInfo?.email ?? ""
        slackName = userInfo?.slackName ?? ""
        phoneNumber = userInfo?.phone ?? ""
        firstName = userInfo?.lastName ?? ""
        firstNameRu = userInfo?.firstNameRu ?? ""
        lastName = userInfo?.lastName ?? ""
        lastNameRu = userInfo?.lastNameRu ?? ""
        dob = userInfo != nil ? DateService.timeStampFormatter(date: userInfo!.doB) : Date()
        repos = userInfo?.repo ?? []
        education = userInfo?.education ?? ""
        info = userInfo?.info ?? ""
    }
}
