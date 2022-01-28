//
//  TaskInfoViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 23.01.2022.
//

import Foundation

// MARK: - Model for Task info Screen
class TaskInfoViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var subscriptions: [TeamMember] = []
    @Published var error: String?
}
