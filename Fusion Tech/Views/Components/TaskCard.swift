//
//  TaskCard.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.01.2022.
//

import SwiftUI

struct TaskCard: View {
    let task: CompanyTask
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            InfoRowView(title: "Задача: ", info: task.title)
            
            InfoRowView(title: "Заказчик: ", info: task.lidContactName)
            
            InfoRowView(title: "Дата начала: ", info: task.projectStartDate != nil ? dateFormatter(date: task.projectStartDate!) : "Не назначено")
            
            InfoRowView(title: "Дата Конца: ", info: task.projectEndDate != nil ? dateFormatter(date: task.projectEndDate!) : "Не назначено")
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
                openLink(link: "tel://\(task.lidPhone)")
            } label: {
                Label("Позвонить лиду", systemImage: "phone.fill")
            }
            
            Button {
                openLink(link: "mailto:\(task.lidEmail)")
            } label: {
                Label("письмо контакту", systemImage: "mail.fill")
            }
        }
    }
}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCard(task: MOCK_TASK)
    }
}
