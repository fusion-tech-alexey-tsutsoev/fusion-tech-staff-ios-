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
    let email: String
    let repos: [String]
    let education: String
    let inCompany: String
    let extraContact: ExtraContact
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            CustomAsyncImageView(avatar: avatar, size: 200).padding()
            
            Group {
                InfoRowView(title: "Логин:", info: login)
                
                InfoRowView(title: "Slack login:", info: slackLogin)
                
                InfoRowView(title: "Телефон:", info: phone)
                
                InfoRowView(title: "Дата Рождения:", info: dateFormatter(date: dob))
                
                InfoRowView(title: "Email", info: email)
                
                InfoRowView(title: "Образование", info: education)
                
                InfoRowView(title: "в компании:", info: inCompany)
            }
            
            CustomDivider()
            
            Group {
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
        .padding(.bottom)
    }
}

struct InfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSectionView(avatar: "", login: "Jhon", slackLogin: "Jhon", phone: "123", dob: "", email: "test@re.c", repos: [""], education: "en", inCompany: "12", extraContact: ExtraContact(whoHasTo: "whife", name: "Test", phoneNumber: "123123"))
    }
}
