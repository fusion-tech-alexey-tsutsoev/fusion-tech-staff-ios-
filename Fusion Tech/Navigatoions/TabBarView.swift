//
//  TabBarView.swift
//  Fusion-Staff
//
//  Created by Fusion Tech on 05.11.2021.
//

import SwiftUI

// MARK: Bottom Tab Nav Bar
struct TabBarView: View {
    // MARK: - Config
    init() {
        let appearance = UITabBar.appearance()
        appearance.backgroundColor = NAV_UI_NAV_BACKGROUND
        appearance.unselectedItemTintColor = SECUNDARY_UI_COLOR
    }
    
    var body: some View {
        TabView {
            // MARK: - Member list
            MemberListView().tabItem {
                Image(systemName: "person.3.fill")
                Text("Команда")
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
        }.accentColor(PRIMARY_COLOR)
    }
    
    struct TabBarView_Previews: PreviewProvider {
        static var previews: some View {
            TabBarView()
        }
    }
}
