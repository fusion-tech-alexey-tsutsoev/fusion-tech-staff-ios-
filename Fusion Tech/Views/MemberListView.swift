//
//  UserListView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 21.12.2021.
//

import SwiftUI

struct MemberListView: View {
    @State private var isLoading = false
    @State private var memberList: [TeamMember] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    if isLoading {
                        SplashView(size: 50)
                    }
                    ForEach(memberList) { member in
                        NavigationLink(destination: MemberInfoView(member: member)) {
                            UserCardView(member: member)
                        }
                    }
                }
            }
            .onAppear {
                loadTeam()
            }
            .navigationTitle("Наша Команда")
        }
    }
    
    //MARK: - Helpers
    private func loadTeam() {
        isLoading = true
        DispatchQueue.main.async {
            ListsServices.shared.getActiveUser { result in
                guard let users = try? result.get() else {
                    isLoading = false
                    return
                }
                memberList = users
                isLoading = false
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        MemberListView()
    }
}
