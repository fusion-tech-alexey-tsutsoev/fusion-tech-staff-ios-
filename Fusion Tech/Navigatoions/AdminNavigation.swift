//
//  AdminNavigation.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.05.2022.
//

import SwiftUI

struct AdminNavigation: View {
    var body: some View {
        List {
            NavigationLink {
                TaskManagment()
            } label: {
                Label("Текущие задачи", systemImage: "chart.bar.doc.horizontal")
            }
            
            NavigationLink {
                ManagmentView()
            } label: {
                Label("Напиать письмо", systemImage: "message.circle")
            }

        }
        .navigationTitle("Панель админа")
    }
}

struct AdminNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AdminNavigation()
    }
}
