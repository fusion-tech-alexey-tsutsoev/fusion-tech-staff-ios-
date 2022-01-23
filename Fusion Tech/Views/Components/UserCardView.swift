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
            CustomAsyncImageView(avatar: member.avatar ?? "", size: 120)
            VStack(alignment: .leading, spacing: 5) {
                Text(getFullNameString(member: member))
                    .foregroundColor(FONT_COLOR)
                    .multilineTextAlignment(.leading)
                
                Text(member.phone)
                    .foregroundColor(FONT_COLOR)
                    .multilineTextAlignment(.leading)
                
                Text(member.email)
                    .foregroundColor(FONT_COLOR)
                    .multilineTextAlignment(.leading)
                
                Text(convertTechRole(role: member.techRole))
                    .foregroundColor(FONT_COLOR)
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .padding(.vertical, 10)
        .padding(.horizontal, 5)
        .background(MAIN_BACKGROUND)
        .border(NAV_BACKGROUND)
        .padding(.bottom, 5)
        .contextMenu {
                Button {
                    openLink(link: "tel://\(member.phone)")
                } label: {
                    Label("Позвонить контакту", systemImage: "phone.fill")
                }
                
                Button {
                    openLink(link: "mailto:\(member.email)")
                } label: {
                    Label("письмо контакту", systemImage: "mail.fill")
                }
                
                Button {
                    let workspace = "T6S33GH9R"
                    let userId = member.slackConversationalID ?? "C6RFKKJ64"
                    openLink(link: "slack://user?team={\(workspace)}&id={\(userId)}")
                } label: {
                    Label("написать в Slack", systemImage: "circle.grid.cross.fill")
                }
            }
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(member: MOCK_MEMBER)
    }
}
