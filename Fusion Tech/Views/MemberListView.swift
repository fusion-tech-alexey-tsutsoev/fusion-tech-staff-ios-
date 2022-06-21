//
//  UserListView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 21.12.2021.
//

import SwiftUI

struct MemberListView: View {
    @ObservedObject private var memberListVM = MemberListViewModel()
    
    // MARK: - BODY
    var body: some View {
        List {
            Section {
                ForEach(memberListVM.searchResults) { member in
                    UserCardView(member: member)
                }
            } header: {
                if memberListVM.isLoading {
                    VStack(alignment: .center) {
                        SplashView(size: 50)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
        }
        .searchable(text: $memberListVM.searchValue)
        .listStyle(.plain)
        .onAppear {
            memberListVM.loadTeam()
        }
        .navigationTitle(Text("Главная"))
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        MemberListView()
    }
}
