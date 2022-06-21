//
//  MemberListViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 05.06.2022.
//

import SwiftUI

class MemberListViewModel: ObservableObject {
    @Published var memberList: [TeamMember] = []
    @Published var isLoading: Bool = false
    @Published var searchValue = ""
    
    var searchResults: [TeamMember] {
        let lowerCaedSearch = searchValue.lowercased()
        if searchValue.isEmpty {
            return memberList
        } else {
            return memberList.filter {
                $0.login.lowercased().contains(lowerCaedSearch)
                || $0.firstName?.lowercased().contains(lowerCaedSearch) ?? false
                || $0.firstNameRu?.lowercased().contains(lowerCaedSearch) ?? false
                || $0.lastName?.lowercased().contains(lowerCaedSearch) ?? false
                || $0.lastNameRu?.lowercased().contains(searchValue) ?? false
            }
        }
    }
    
    func loadTeam() {
        self.isLoading = true
        
        DispatchQueue.main.async {
            ListsServices.shared.getActiveUser { result in
                guard let users = try? result.get() else {
                    self.isLoading = false
                    return
                }
                self.memberList = users
                self.isLoading = false
            }
        }
    }
    
    func loadUsersBySearch() {
        self.isLoading = true
        
        DispatchQueue.main.async {
            ListsServices.shared.getUsersByName(searchValue: self.searchValue) { result in
                guard let users = try? result.get() else {
                    self.isLoading = false
                    return
                }
                self.memberList = users
                self.isLoading = false
            }
        }
    }
}
