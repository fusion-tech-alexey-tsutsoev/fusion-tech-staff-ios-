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
            CustomAsyncImageView(avatar: member.avatar, size: 200)
            
            InfoRowView(title: "Login", info: member.login)
            
            InfoRowView(title: "Имя", info: "\(member.firstNameRu ?? "Иван") / \(member.firstName ?? "Ivan")")
            
            InfoRowView(title: "Фамилия", info: "\(member.lastNameRu ?? "Иванов") / \(member.lastName ?? "Ivanov")")
            
            InfoRowView(title: "Дата рождения", info: dateFormatter(date: member.doB ?? ""))
            
            HStack(alignment: .center, spacing: 10) {
                InfoRowView(title: "Телефон", info: member.phone)
                
                Button {
                    guard let url = URL(string: "tel://\(member.phone)") else {
                        return
                    }
                    UIApplication.shared.open(url)
                } label: {
                    Image(systemName: "phone.fill").foregroundColor(PRIMARY_COLOR)
                }
            }
            HStack(alignment: .center, spacing: 10) {
                InfoRowView(title: "Email", info: member.email)
                
                Button {
                    guard let url = URL(string: "mailto:\(member.email)") else {
                        return
                    }
                    UIApplication.shared.open(url)
                } label: {
                    Image(systemName: "mail.fill").foregroundColor(PRIMARY_COLOR)
                }
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
        .navigationTitle(Text("\(member.firstNameRu ?? "Jhon") \(member.lastNameRu ?? "Doe")"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MemberInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MemberInfoView(member: MOCK_MEMBER)
    }
}
