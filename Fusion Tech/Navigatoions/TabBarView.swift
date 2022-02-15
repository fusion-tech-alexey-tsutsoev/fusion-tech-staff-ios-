//
//  TabBarView.swift
//  Fusion-Staff
//
//  Created by Fusion Tech on 05.11.2021.
//

import SwiftUI

// MARK: Bottom Tab Nav Bar
struct TabBarView: View {
    // MARK: - Enviroment
    @EnvironmentObject var store: Store
    // MARK: - Config
    init() {
        let appearance = UITabBar.appearance()
        appearance.backgroundColor = NAV_UI_NAV_BACKGROUND
        appearance.unselectedItemTintColor = SECUNDARY_UI_COLOR
    }
    
    var body: some View {
        TabView {
            // MARK: - Member list
            HomeNavigation().tabItem {
                Image(systemName: "house.fill")
                Text("Главная")
            }
            // MARK: - Add Request
            RequestFormView().tabItem {
                Image(systemName: "plus.circle")
                Text("Создать заявку")
            }
            // MARK: - User screen
            UserInfoView().tabItem {
                Image(systemName: "person.fill")
                Text("Информация")
            }
            
            // MARK: - Admin Panel
            if store.state.user?.role == "admin" {
                AdminPanelView().tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Администрация")
                }
                
                ManagmentView().tabItem {
                    Image(systemName: "doc.on.clipboard")
                    Text("Менеджмент")
                }
            }
        }.accentColor(PRIMARY_COLOR)
    }
}
