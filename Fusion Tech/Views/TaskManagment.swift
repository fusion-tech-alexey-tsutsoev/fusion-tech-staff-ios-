//
//  AdminPanekView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.01.2022.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct TaskManagment: View {
    @ObservedObject var adminPanelVM = AdminPanelViewModel()
    var body: some View {
        VStack {
            FloatingLabelTextField($adminPanelVM.search, placeholder: "Поиск")
                .getSearchBarStyle()
                .padding(.bottom, 10)
            
            ScrollView {
                LazyVStack(alignment: .center, spacing: 0) {
                    if (adminPanelVM.isLoading) {
                        SplashView(size: 50)
                    }
                    
                    if (adminPanelVM.filteredTasks.isEmpty && !adminPanelVM.isLoading) {
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
    
    // MARK: - Helpers
    private func loadtasks() {
        adminPanelVM.isLoading = true
        RequestService.shared.getTasksByApi { result in
            print("result \(result)")
            switch result {
            case .success(let tasks):
                adminPanelVM.tasks = tasks.crmContracts
                adminPanelVM.filteredTasks = tasks.crmContracts
            case .failure(let apiErr):
                adminPanelVM.error = apiErr.errorDescriprion
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
        TaskManagment()
    }
}
