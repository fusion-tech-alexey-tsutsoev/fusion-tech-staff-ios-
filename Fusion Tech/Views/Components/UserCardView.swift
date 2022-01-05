//
//  UserCardView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 21.12.2021.
//

import SwiftUI

struct UserCardView: View {
    let member: TeamMember
    
    var body: some View {
        HStack( alignment: .center, spacing: 20) {
            CustomAsyncImageView(avatar: member.avatar, size: 120)
            VStack(alignment: .leading, spacing: 5) {
                Text(getFullName()).foregroundColor(.white).multilineTextAlignment(.leading)
                Text(member.phone).foregroundColor(.white).multilineTextAlignment(.leading)
                Text(member.email).foregroundColor(.white).multilineTextAlignment(.leading)
                Text(convertTechRole(role: member.techRole)).foregroundColor(.white)
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .topLeading
        ).padding(.vertical, 10).padding(.horizontal, 5).background(MAIN_BACKGROUND).border(NAV_BACKGROUND).padding(.bottom, 5).contextMenu {
            Button {
                guard let url = URL(string: "tel://\(member.phone)") else {
                    return
                }
                UIApplication.shared.open(url)
            } label: {
                Label("Позвонить контакту", systemImage: "phone.fill")
            }
            
            Button {
                guard let url = URL(string: "mailto:\(member.email)") else {
                    return
                }
                UIApplication.shared.open(url)
                
            } label: {
                Label("письмо контакту", systemImage: "mail.fill")
            }
            
            Button {
                let workspace = "T6S33GH9R"
                let userId = member.slackConversationalID ?? "C6RFKKJ64"
                guard let url = URL(string: " slack://user?team={\(workspace)}&id={\(userId)}") else {
                    return
                }
                UIApplication.shared.open(url)
            } label: {
                Label("написать в Slack", systemImage: "circle.grid.cross.fill")
            }
        }
    }
    // MARK: - Helpers
    func getFullName() -> String {
        return (member.firstNameRu ?? member.firstName ?? "Jhon") + " " + (member.lastNameRu ?? member.lastName ?? "Doe")
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(member: MOCK_MEMBER)
    }
}
