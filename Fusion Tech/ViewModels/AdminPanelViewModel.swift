//
//  AdminPanelModelView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.01.2022.
//

import Foundation
import SwiftUI

// MARK: - Model for administration panel
class AdminPanelViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var isShowSheet: Bool = false
    @Published var tasks: [CRM] = []
    @Published var filteredTasks: [CRM] = []
    @Published var error: String?
    
    @Published var search: String = ""
}
