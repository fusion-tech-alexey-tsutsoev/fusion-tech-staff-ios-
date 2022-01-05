//
//  InfoSection.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.01.2022.
//

import SwiftUI

struct InfoSectionView: View {
    // MARK: - Fields
    let avatar: String
    let login: String
    let slackLogin: String
    let phone: String
    let dob: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            CustomAsyncImageView(avatar: avatar, size: 200).padding()
            InfoRowView(title: "Логин:", info: login)
            InfoRowView(title: "Slack login:", info: slackLogin)
            InfoRowView(title: "Телефон:", info: phone)
            InfoRowView(title: "Дата Рождения:", info: dateFormatter(date: dob))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct InfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSectionView(avatar: "", login: "Jhon", slackLogin: "Jhon", phone: "123", dob: "")
    }
}
