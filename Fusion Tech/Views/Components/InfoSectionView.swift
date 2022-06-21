//
//  InfoSection.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.01.2022.
//

import SwiftUI

struct InfoSectionView: View {
    // MARK: - Fields
    let extraContact: ExtraContact
    let user: User?
    
    init (user: User?) {
        self.user = user
        extraContact = ExtraContact(
            whoHasTo: user?.additionalContactType ?? "",
            name: user?.additionalContactName ?? "",
            phoneNumber: user?.additionalContactPhone ?? ""
        )
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                if let avatar = user?.avatar {
                    CustomAsyncImageView(avatar: avatar, size: 100)
                }
               
                
                Group {
                    InfoRowView(title: "Логин:", info: user?.login ?? "No name")
                    
                    InfoRowView(title: "Slack login:", info: user?.slackName ?? "No Slack Name")
                    
                    InfoRowView(title: "Телефон:", info: user?.phone ?? "123456789")
                    
                    InfoRowView(title: "Дата Рождения:", info: DateService.dateFormatter(date: user?.doB ?? ""))
                    
                    InfoRowView(title: "Email", info: user?.email ?? "no Email")
                    
                    InfoRowView(title: "Образование", info: user?.education ?? "No education")
                    
                    InfoRowView(title: "в компании:", info: "\(DateService.makeDateDiff(timeStamp: user?.workingFrom ?? "")) с (\(DateService.dateFormatter(date: user?.workingFrom ?? ""))")
                }
                
                CustomDivider()
                
                Group {
                    
                    if let repos = user?.repo {
                        Text("Репозитории: ").bold()
                        
                        ForEach(repos, id: \.self) { repo in
                            Button {
                                if let url = URL(string: repo) {
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                Text(repo)
                            }
                        }
                        
                        CustomDivider()
                    }
                    
                    Text("Дополнительный контакт:").bold()
                    
                    InfoRowView(title: "Кем приходится:", info: extraContact.whoHasTo)
                    
                    InfoRowView(title: "Имя:", info: extraContact.name)
                    
                    Button {
                        openLink(link: "tel://\(extraContact.phoneNumber)")
                    } label: {
                        InfoRowView(title: "Телефон:", info: extraContact.phoneNumber)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}
