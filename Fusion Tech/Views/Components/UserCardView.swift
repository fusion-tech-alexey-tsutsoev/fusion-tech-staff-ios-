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
        NavigationLink(destination: MemberInfoView(member: member)) {
            HStack( alignment: .center, spacing: 20) {
                CustomAsyncImageView(avatar: member.avatar ?? "", size: 54)
                VStack(alignment: .leading, spacing: 5) {
                    ThemedText(text: getFullNameString(member: member), weight: .bold)
                    
                    
                    ThemedText(text: convertTechRole(role: member.techRole), weight: .thin)
                }
                
                Spacer()
                
                HStack {
                    ImageButton(systemImageName: "phone.fill") {
                        openLink(link: "tel://\(member.phone)")
                    }
                    
                    ImageButton(systemImageName: "envelope") {
                        openLink(link: "mailto:\(member.email)")
                    }
                }
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
                Label("Позвонить контакту", systemImage: "phone")
            }
            
            Button {
                openLink(link: "mailto:\(member.email)")
            } label: {
                Label("письмо контакту", systemImage: "envelope")
            }
            
            Button {
                openSlack()
            } label: {
                Label("написать в Slack", systemImage: "circle.grid.cross.fill")
            }
        }
    }
    
    //MARK: - Helpers
    private func openSlack() {
        let workspace = "T6S33GH9R"
        let userId = member.slackConversationalID ?? "C6RFKKJ64"
        openLink(link: "slack://user?team={\(workspace)}&id={\(userId)}")
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(member: MOCK_MEMBER)
    }
}
