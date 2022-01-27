//
//  HomeNavigation.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import SwiftUI

struct HomeNavigation: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedTab) {
                    ForEach(HOME_PICKER_ARRAY) { tab in
                        Text(tab.title).tag(tab.id)
                    }
                }
                .pickerStyle(.segmented)
                ScrollView {
                    switch selectedTab {
                    // MARK: - Team List
                    case 0:
                        MemberListView()
                    // MARK: - Article List
                    case 1:
                        ArticleListView()
                    default:
                        Text("Something went wrong")
                    }
                }
                .navigationTitle(Text(getNavTitle()))
            }
        }
    }
    
    // MARK: - Helpers
    func getNavTitle() -> String{
        return HOME_PICKER_ARRAY.first(where: { tab in tab.id == selectedTab })?.title ?? ""
    }
}

struct HomeNavigation_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigation()
    }
}
