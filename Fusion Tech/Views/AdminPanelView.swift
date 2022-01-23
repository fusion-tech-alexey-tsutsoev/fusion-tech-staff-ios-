//
//  AdminPanekView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.01.2022.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct AdminPanelView: View {
    @ObservedObject var adminPanelVM = AdminPanelModelView()
    var body: some View {
        NavigationView {
            VStack {
                FloatingLabelTextField($adminPanelVM.search, placeholder: "Поиск")
                    .getSearchBarStyle()
                    .padding(.bottom, 10)
                
                ScrollView {
                    VStack(alignment: .center, spacing: 0) {
                        if (adminPanelVM.isLoading) {
                            SplashView(size: 50)
                        }
                        if adminPanelVM.filteredTasks.isEmpty {
                            EmptyDataView(title: "Нет таск по запросу")
                        } else {
                            ForEach(adminPanelVM.filteredTasks) { task in
                                NavigationLink(destination: TaskInfoView(task: task)) {
                                    TaskCard(task: task)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                loadtasks()
            }
            .onChange(of: adminPanelVM.search, perform: { newValue in
                searchInTasksByTitle(text: newValue)
            })
            .navigationTitle("Список задач")
        }
    }
    
    // MARK: - Helpers
    private func loadtasks() {
        adminPanelVM.isLoading = true
        RequestService.shared.getTasksByApi { result in
            switch result {
            case .success(let tasks):
                adminPanelVM.tasks = tasks
                adminPanelVM.filteredTasks = tasks
            case .failure(let apiErr):
                adminPanelVM.error = apiErr.errorDescriprion ?? "тчо-то пошло не так"
            }
            adminPanelVM.isLoading = false
        }
    }
    
    private func searchInTasksByTitle(text: String) {
        if !text.isEmpty {
            let newTasks = adminPanelVM.tasks.filter { item in
                item.title.lowercased().contains(text.lowercased())
            }
            withAnimation {
                adminPanelVM.filteredTasks = newTasks
            }
        } else {
            adminPanelVM.filteredTasks = adminPanelVM.tasks
        }
    }
}

struct AdminPanelView_Previews: PreviewProvider {
    static var previews: some View {
        AdminPanelView()
    }
}
