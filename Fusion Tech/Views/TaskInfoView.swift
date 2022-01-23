//
//  TaskInfoView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 23.01.2022.
//

import SwiftUI

struct TaskInfoView: View {
    let task: CompanyTask
    @ObservedObject var taskInfoVM = TaskInfoViewModel()
    var body: some View {
        List {
            if taskInfoVM.isLoading {
                SplashView(size: 50)
            }
            
            if (!taskInfoVM.subscriptions.isEmpty) {
                Section("Команда") {
                    ForEach(taskInfoVM.subscriptions) { user in
                        NavigationLink(destination: MemberInfoView(member: user)) {
                            UserCardView(member: user)
                        }
                        
                    }
                }
            }
            Section("Базовая нформация") {
                InfoRowView(title: "Описание:", info: task.bodyDescription)
                
                InfoRowView(title: "Стек:", info: task.technologies.joined(separator: ","))
                
                InfoRowView(title: "Подписаны:", info: task.subscription.map(String.init).joined(separator: ","))
                
                InfoRowView(title: "Комментарий:", info: task.comment)
                
                if let eventDesc = task.eventDescription {
                    InfoRowView(title: "Описание события:", info: eventDesc)
                }
            }
            
            Section("Контакты") {
                InfoRowView(title: "Компания:", info: task.lidCompany)
                
                InfoRowView(title: "Контакт:", info: task.lidContactName)
                
                InfoRowView(title: "Локация:", info: task.lidLocation)
                
                InfoRowView(title: "Таймзона:", info: task.lidTimeZone)
                
                InfoRowView(title: "Skype:", info: task.lidSkype)
                
                PhoneInfoRow(phone: task.lidPhone)
                
                EmailInfoRow(email: task.lidEmail)
            }
            
            Section("Даты") {
                InfoRowView(title: "Дата создания:", info: dateFormatter(date: task.createdAt))
                
                InfoRowView(title: "Дата Обновления:", info: dateFormatter(date: task.updatedAt))
                
                InfoRowView(title: "Дата начала:", info: task.projectStartDate != nil ? dateFormatter(date: task.projectStartDate!) : "Не назначено")
                
                InfoRowView(title: "Дата Конца:", info: task.projectEndDate != nil ? dateFormatter(date: task.projectEndDate!) : "Не назначено")
                
                if let eventDate = task.eventDatetime {
                    InfoRowView(title: "Дата Cобытия:", info: dateFormatter(date: eventDate))
                }
            }
            
            Section("Ссылки") {
                InfoRowView(title: "CRM:", info: task.jobLink ?? "No")
                
                Button {
                    openLink(link: task.proposalLink)
                } label: {
                    InfoRowView(title: "Upwork:", info: task.proposalLink)
                }

            }
            
        }
        .listStyle(.grouped)
        .navigationTitle(task.title)
        .onAppear {
            taskInfoVM.isLoading = true
            var newValue: [TeamMember] = []
            task.subscription.forEach { sub in
                UserService.shared.getUserById(id: sub) { result in
                    switch (result) {
                    case .success(let member):
                        newValue.append(member)
                    case .failure(let err):
                        taskInfoVM.error = err.errorDescriprion ?? "Что-то пошло не так"
                    }
                    taskInfoVM.subscriptions = newValue
                    taskInfoVM.isLoading = false
                }
            }
        }
    }
}

struct TaskInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoView(task: MOCK_TASK)
    }
}
