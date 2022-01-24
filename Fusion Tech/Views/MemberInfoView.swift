//
//  MemberInfoView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.12.2021.
//

import SwiftUI

struct MemberInfoView: View {
    let member: TeamMember
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            CustomAsyncImageView(avatar: member.avatar ?? "", size: 200)
            
            Group {
                InfoRowView(title: "Login", info: member.login)
                
                InfoRowView(title: "Имя", info: "\(member.firstNameRu ?? "Иван") / \(member.firstName ?? "Ivan")")
                
                InfoRowView(title: "Фамилия", info: "\(member.lastNameRu ?? "Иванов") / \(member.lastName ?? "Ivanov")")
                
                InfoRowView(title: "Дата рождения", info: dateFormatter(date: member.doB ?? ""))
                
                PhoneInfoRow(phone: member.phone)
                
                EmailInfoRow(email: member.email)
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding()
        .navigationTitle(Text(getFullNameString(member: member)))
    }
}

struct MemberInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MemberInfoView(member: MOCK_MEMBER)
    }
}
