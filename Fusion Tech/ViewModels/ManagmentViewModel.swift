//
//  ManagmentViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 06.02.2022.
//

import SwiftUI

// MARK: - Model for MEETING RECAP
class ManagmentViewModel: ObservableObject {
    // MARK: - fields
    @Published var clientComanyName = ""
    @Published var cleintTeamName = ""
    @Published var yourTeamName = ""
    @Published var discussionItem = ""
    @Published var arragement = ""
    @Published var additionalInfo = "No Additional Info"
    
    // MARK: - arrays
    @Published var clientTeamNames: [String] = []
    @Published var yourTeamNames: [String] = []
    @Published var arragements: [String] = []
    @Published var discussionItems: [String] = []
    
    // MARK: - Flags
    @Published var isShowExporter = false
}
