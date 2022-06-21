//
//  MemberInfoView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.12.2021.
//

import SwiftUI

@in

struct MemberInfoView: View {
    let member: TeamMember
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CustomAsyncImageView(avatar: member.avatar ?? "", size: .infinity)
                    .padding(.bottom, 10)
                
                Group {
                    InfoRowView(title: "Login", info: member.login)
                    
                    InfoRowView(title: "Имя", info: "\(member.firstNameRu ?? "Иван") / \(member.firstName ?? "Ivan")")
                    
                    InfoRowView(title: "Фамилия", info: "\(member.lastNameRu ?? "Иванов") / \(member.lastName ?? "Ivanov")")
                    
                    InfoRowView(title: "Дата рождения", info: DateService.dateFormatter(date: member.doB ?? ""))
                    
                    PhoneInfoRow(phone: member.phone)
                    
                    EmailInfoRow(email: member.email)
                }
                
                if let repos = member.repo {
                    CustomDivider()
                    
                    Text("Репозитории: ")
                        .font(.title)
                    
                    ForEach(repos, id: \.self) { repo in
                        Button {
                            if let url = URL(string: repo) {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            Text(repo)
                        }
                    }
                }
                
                if let workingFrom = member.workingFrom {
                    
                    CustomDivider()
                    
                    InfoRowView(title: "В компании", info: DateService.makeDateDiff(timeStamp: workingFrom))
                    
                }
                
                if isHaveAdditinalContact() {
                    
                    CustomDivider()
                    
                    Text("Дополнительный контакт")
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    InfoRowView(title: "Имя", info: member.additionalContactName ?? "Джон До")
                    
                    InfoRowView(title: "Кто", info: member.additionalContactType ?? "близкий")
                    
                    if let additionalPhone = member.additionalContactPhone {
                        PhoneInfoRow(phone: additionalPhone)
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
            .navigationTitle(Text(getFullNameString(member: member)))
        }
    }
    
    private func isHaveAdditinalContact() -> Bool {
        guard let additionalContactType = member.additionalContactType, let additionalContactName = member.additionalContactName, let additionalContactPhone = member.additionalContactPhone else {
            return false
        }
        return !(additionalContactType.isEmpty && additionalContactName.isEmpty && additionalContactPhone.isEmpty)
    }
}

struct MemberInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MemberInfoView(member: MOCK_MEMBER)
    }
}
